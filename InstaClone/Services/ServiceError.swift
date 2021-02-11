//
//  ServiceError.swift
//  InstaClone
//
//  Created by new on 19/11/2020.
//

import Foundation

enum ServiceError: Error {
    case failedToFetchUserData
    case failedToEncodeUserData
    case failedToLogin
    case failedToUploadPhoto
    case failedToDownloadPhoto
    case failedToListPhotos
    case failedToUnwrapData
}
