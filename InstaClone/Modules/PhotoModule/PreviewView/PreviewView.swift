//
//  PreviewView.swift
//  InstaClone
//
//  Created by new on 21/12/2020.
//

import UIKit
import AVKit
import AVFoundation

class PreviewView: UIView {
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
}

