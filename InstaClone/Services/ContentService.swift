//
//  ContentService.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation
import FirebaseStorage

protocol ContentServiceProtocol {
    
}

final class ContentService: ContentServiceProtocol {
    
    let storage = Storage.storage()
    
    func uploadRef() {
        let randomID = UUID.init().uuidString
        let uploadRef = storage.reference(withPath: "photos/\(randomID).jpg")
        guard let imageData = imageView.image?.jpegData(compressionQuality: 0.75) else { return }
        let uploadMetadata = StorageMetadata.init()
        uploadMetadata.contentType = "image/jpeg"
        
        uploadRef.putData(imageData, metadata: uploadMetadata) { (downloadMetadata, error) in
            if let error = error {
                print("error")
                return
            }
            print("\(String(downloadMetadata))")
        }
    }
}
