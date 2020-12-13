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
    
    init() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            guard let userID = user?.uid else { return }
            userProfileService.getUser(withID: userID) { result in
                switch result {
                case .success(let userData) :
//                    numberOfPosts = userData
                return
                case .failure:
                    return
                }
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
