//
//  PhotoView.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation
import SnapKit
import AVKit

class PhotoView: UIView {
    
    // MARK: - Properties
    
    private let viewModel: PhotoViewModel
    
    // MARK: - UI Properties
    
    private var previewView: PreviewView!
    private var capturePhotoButton: UIButton!
    
    // MARK: - AV Properties
    private var captureSession: AVCaptureSession!
    private var photoOutput: AVCapturePhotoOutput!
    
    init(with viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        connectInputsAndOutputsToTheSession()
        displayACameraPreview()
        setupCapturePhotoButton()
    }
    
    required init?(coder: NSCoder) {
        nil
    }

}

// MARK: - Capture Session Setup
private extension PhotoView {
    
    func connectInputsAndOutputsToTheSession() {
        captureSession = AVCaptureSession()
        
        captureSession.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified)
        
        guard
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
            captureSession.canAddInput(videoDeviceInput)
        else {
            return
        }
        captureSession.addInput(videoDeviceInput)
        
        photoOutput = AVCapturePhotoOutput()
        guard captureSession.canAddOutput(photoOutput) else { return }
        captureSession.sessionPreset = .photo
        captureSession.addOutput(photoOutput)
        captureSession.commitConfiguration()
    }
    
    func displayACameraPreview() {
        self.previewView = PreviewView()
        self.previewView.videoPreviewLayer.session = self.captureSession
        addSubview(previewView)
        
        previewView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

// MARK: - Private methods
private extension PhotoView {
    
    @objc func didTapCapturePhotoButton() {
        photoOutput.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
    
}

// MARK: - View setup
private extension PhotoView {
    
    func setupCapturePhotoButton() {
        capturePhotoButton = UIButton(type: .system)
        addSubview(capturePhotoButton)
        
        capturePhotoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(4.0)
            make.height.width.equalTo(64.0)
        }
        
        capturePhotoButton.backgroundColor = UIColor.lightGray
        capturePhotoButton.layer.cornerRadius = 32.0
        capturePhotoButton.layer.borderWidth = 1.0
        capturePhotoButton.layer.borderColor = UIColor.black.cgColor
        capturePhotoButton.addTarget(self, action: #selector(didTapCapturePhotoButton), for: .touchUpInside)
    }
    
}

extension PhotoView: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error == nil {
            guard
                let imageData = photo.fileDataRepresentation(),
                let uiImage = UIImage(data: imageData)
            else {
                print("Something is wrong with creating UIImage from captured photo data")
                return
            }
            viewModel.capturePhotoButtonTapped(with: uiImage)
        } else {
            print("Something is wrong with capturing photo")
            return
        }
    }
    
}
