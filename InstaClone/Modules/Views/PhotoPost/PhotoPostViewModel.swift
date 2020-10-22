//
//  PhotoPostViewModel.swift
//  InstaClone
//
//  Created by new on 18/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

class PhotoPostViewModel {
    
    let numberOfPosts = ["uno", "due", "tre"] //I don't know how to make infinity scroll system so for now I add only this array to let tableView show anything
    let coordinator: PhotoPostCoordinator?
    
    init(coordinator: PhotoPostCoordinator) {
        self.coordinator = coordinator
    }
}

extension PhotoPostViewModel: PhotoPostTableViewCellViewModelDelegate {
    func didTapPosterNameButton() {
        coordinator?.didTapPosterNameButton()
    }
    
    func didTapMoreOptionsButton() {
        coordinator?.didTapMoreOptionsButton()
    }
    
    func didTapLikeButton() {
        coordinator?.didTapLikeButton()
    }
    
    func didTapCommentButton() {
        coordinator?.didTapCommentButton()
    }
    
    func didTapDMButton() {
        coordinator?.didTapDMButton()
    }
    
    func didTapSaveButton() {
        coordinator?.didTapSaveButton()
    }
    
    func didTapNumberOfLikesButton() {
        coordinator?.didTapNumberOfLikesButton()
    }
    
    
}
