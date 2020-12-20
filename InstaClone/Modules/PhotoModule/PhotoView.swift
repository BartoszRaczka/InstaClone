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
    
    init(with viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

//        setupCameraView()
//        setupCapturePhotoButton()
        connectInputsAndOutputsToTheSession()
        displayACameraPreview()
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
        
        let photoOutput = AVCapturePhotoOutput()
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

// MARK: - View setup
private extension PhotoView {
    
    func setupCameraView() {
        
    }
    
    func setupCapturePhotoButton() {
        
    }
    
}
