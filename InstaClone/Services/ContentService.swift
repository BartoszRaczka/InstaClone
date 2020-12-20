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
    func uploadData(imageID: String, image: UIImage, data: Data, userID: UserData, completionHandler: @escaping (Result<Void, Error>) -> Void)
    func downloadData(imageID: String, image: UIImage, data: Data, UserID: UserData, completionHandler: @escaping (Result<Void, Error>) -> Void)
}

final class ContentService: ContentServiceProtocol {
 
    let storage = Storage.storage()
   
    func uploadData(imageID: String, image: UIImage, data: Data, userID: UserData, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        let imageID = UUID().uuidString
            guard
                let image = UIImage(named: "\(image)"),
                let data = image.pngData(),
                let userID = Auth.auth().currentUser?.uid
            else {
                completionHandler(.failure(ServiceError.failedToUploadPhoto))
                return
            }
        completionHandler(.success(()))
        
        let reference = storage.reference(withPath: "users/\(userID)/photos/\(imageID).png")
        reference.putData(data, metadata: nil) { metadata, error in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(()))
            }
        }
    }
    
    func downloadData(imageID: String, image: UIImage, data: Data, UserID: UserData, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        let imageID = UUID().uuidString
            guard
                let image = UIImage(named: "\(image)"),
                let data = image.pngData(),
                let userID = Auth.auth().currentUser?.uid
            else {
                completionHandler(.failure(ServiceError.failedToUploadPhoto))
                return
            }
        completionHandler(.success(()))
        
        let reference = storage.reference(withPath: "users/\(userID)/photos/\(imageID).png")
        reference.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                completionHandler(.failure(error))
            } else {
                completionHandler(.success(()))
            }
        }
    }

}
