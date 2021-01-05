//
//  PhotoViewController.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import SnapKit
import AVFoundation

class PhotoViewController: UIViewController {
    
    // MARK: Properties
    private let viewModel: PhotoViewModel!
    
    // MARK: - AV Properties
    private var captureSession: AVCaptureSession!
    private var photoOutput: AVCapturePhotoOutput!
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    init(with viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        super.loadView()
        view = PhotoView(with: self.viewModel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        connectInputsAndOutputsToTheSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
    }
    
}

// MARK: - Public methods
extension PhotoViewController {
    
    func capturePhotoButtonTapped() {
        print("viewController know about tapping capturePhotoButton")
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
    
}


// MARK: - Capture Session Setup
private extension PhotoViewController {

    func connectInputsAndOutputsToTheSession() {
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium

        guard
            let backCamera = AVCaptureDevice.default(for: AVMediaType.video),
            let videoDeviceInput = try? AVCaptureDeviceInput(device: backCamera)
        else {
            print("Unable to access back camera!")
            return
        }

        photoOutput = AVCapturePhotoOutput()

        if captureSession.canAddInput(videoDeviceInput) && captureSession.canAddOutput(photoOutput) {
            captureSession.addInput(videoDeviceInput)
            captureSession.addOutput(photoOutput)
            setupLivePreview()
        }
        
    }
    
    func setupLivePreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            
        videoPreviewLayer.videoGravity = .resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait
        (view as? PhotoView)?.previewView.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
            DispatchQueue.main.async {
                guard let bounds = (self.view as? PhotoView)?.previewView.bounds else { return }
                self.videoPreviewLayer.frame = bounds
            }
        }
    }

}

extension PhotoViewController: AVCapturePhotoCaptureDelegate {

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error == nil {
            guard
                let imageData = photo.fileDataRepresentation(),
                let uiImage = UIImage(data: imageData)
            else {
                print("Something is wrong with creating UIImage from captured photo data")
                return
            }
            viewModel.photoCaptured(with: uiImage)
        } else {
            print("Something is wrong with capturing photo")
            return
        }
    }

}
