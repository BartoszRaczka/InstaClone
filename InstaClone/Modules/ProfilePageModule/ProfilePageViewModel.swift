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

struct ProfilePageViewModel {
    
    let userProfileService = UserProfileService()
    
    var numberOfPosts: Int
    var numberOfFollowers: Int
    var numberOfFollowing: Int
    var descriptionLabelText: String
    
    var delegate: ProfilePageViewModelDelegate?
    
    init(delegate: ProfilePageViewModelDelegate) {
        self.delegate = delegate
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let userID = user?.uid {
                userProfileService.getUser(withID: userID) { result in
                    switch result {
                    case .success(let userData) :
                        numberOfFollowers = userData.followers.count
                        numberOfFollowing = userData.following.count
                        numberOfPosts = 100
                        descriptionLabelText = "asd"
                    case .failure:
                        return
                    }
                }
            } else {
                numberOfFollowing = 1
                numberOfFollowers = 2
                numberOfPosts = 3
                descriptionLabelText = "description"
            }
        }
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
    
}
