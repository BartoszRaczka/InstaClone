//
//  ProfilePageViewController.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//

import SnapKit

protocol ProfilePageViewControllerDelegate: AnyObject {
    
    func didTapUserProfilePictureButton()
    func didTapNumberOfPostsButton()
    func didTapNumberOfFollowersButton()
    func didTapNumberOfFollowingButton()
    func didTapEditProfileButton()
    
}

final class ProfilePageViewController: UIViewController {
    
    private let viewModel: ProfilePageViewModel
    var delegate: ProfilePageViewControllerDelegate?
    
    init(with viewModel: ProfilePageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        super.loadView()
        view = ProfilePageView(with: self.viewModel)
    }

}

extension ProfilePageViewController: ProfilePageViewModelDelegate {
    
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
