//
//  ContentService.swift
//  InstaClone
//
//  Created by new on 10/12/2020.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

protocol ContentServiceProtocol {
    func uploadData(image: UIImage, completionHandler: @escaping (Result<Void, Error>) -> Void)
    func downloadData(imageID: String, UserID: UserData, completionHandler: @escaping (Result<Data, Error>) -> Void)
}

final class ContentService: ContentServiceProtocol {
 
    private let storage = Storage.storage()
   
    func uploadData(image: UIImage, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        let imageID = UUID().uuidString
        guard
            let image = image as UIImage?, //UIImage(named: "\(image)"),
            let data = image.pngData(),
            let userID = Auth.auth().currentUser?.uid
        else {
            completionHandler(.failure(ServiceError.failedToUploadPhoto))
            return
        }
        
        let reference = storage.reference(withPath: "users/\(userID)/photos/\(imageID).png")
        reference.putData(data, metadata: nil) { metadata, error in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(()))
            }
        }
    }
    
    func downloadData(imageID: String, UserID: UserData, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        let imageID = UUID().uuidString
        let userID = Auth.auth().currentUser?.uid
        
        let reference = storage.reference(withPath: "users/\(String(describing: userID))/photos/\(imageID).png")
        
        reference.getData(maxSize: 1 * 1024 * 1024) { data, error in
            
            if let error = error {
                completionHandler(.failure(error))
            } else if let data = data {
                completionHandler(.success(data))
            }
        }
    }

}
