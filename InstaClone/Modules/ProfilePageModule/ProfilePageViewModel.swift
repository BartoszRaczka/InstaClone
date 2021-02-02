//
//  ProfilePageViewModel.swift
//  InstaClone
//
//  Created by new on 01/11/2020.
//

import Foundation
import FirebaseAuth

protocol ProfilePageViewModelDelegate: AnyObject {
    
    func didTapUserProfilePictureButton()
    func didTapNumberOfPostsButton()
    func didTapNumberOfFollowersButton()
    func didTapNumberOfFollowingButton()
    func didTapEditProfileButton()
    
}

final class ProfilePageViewModel {
    
    let userProfileService: UserProfileServiceProtocol
    
    var numberOfPosts: Int = 0
    var numberOfFollowers: Int = 0
    var numberOfFollowing: Int = 0
    var descriptionLabelText: String = " "
    
    var delegate: ProfilePageViewModelDelegate?
    
    init(delegate: ProfilePageViewModelDelegate, userProfileService: UserProfileServiceProtocol) {
        self.delegate = delegate
        self.userProfileService = userProfileService
        setupData()
    }
    
    func didTapUserProfilePictureButton() {
        delegate?.didTapUserProfilePictureButton()
    }
    
    func didTapNumberOfPostsButton() {
        delegate?.didTapNumberOfPostsButton()
    }
    
    func didTapNumberOfFollowersButton() {
        delegate?.didTapNumberOfFollowersButton()
    }
    
    func didTapNumberOfFollowingButton() {
        delegate?.didTapNumberOfFollowingButton()
    }
    
    func didTapEditProfileButton() {
        delegate?.didTapEditProfileButton()
    }
    
    func setupData() {
        guard let userID = Auth.auth().currentUser?.uid else {
            do { print("Failed to get user's ID") }
            return
        }
        userProfileService.getUser(withID: userID) { result in
            switch result {
            case .success(let userData):
                self.numberOfFollowers = userData.followers.count
                self.numberOfFollowing = userData.following.count
                self.numberOfPosts = 100
                self.descriptionLabelText = "asd"
            case .failure:
                print("Failed to fetch user's data")
            }
        }
        
        func getPhotoList() {
            userProfileService.listFiles() { result in
                print(result)
            }
        }
        
        //zapytanie do serwisu o pobranie wszystkich zdjęć
        
    }
    
}
