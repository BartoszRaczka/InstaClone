//
//  DependencyContainer.swift
//  InstaClone
//
//  Created by Rafał Małczyński on 16/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

final class DependencyContainer {
    
    lazy var userProfileService: UserProfileServiceProtocol = UserProfileService()
    lazy var photoFeedService: PhotoFeedServiceProtocol = PhotoFeedService()
    
}
