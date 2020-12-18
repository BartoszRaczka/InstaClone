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
   
    func uploadData() {
        let imageID = UUID().uuidString
        let image = UIImage(named: "\()")
        let data = image?.pngData()
        
        let reference = storage.reference(withPath: "users/\()/photos/\(imageID).png")
        reference.putData(data, metadata: nil) { metadata, error in
        }
    }
}
