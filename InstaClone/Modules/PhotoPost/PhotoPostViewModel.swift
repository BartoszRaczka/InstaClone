//
//  PhotoPostViewModel.swift
//  InstaClone
//
//  Created by new on 18/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

protocol PhotoPostViewModelDelegate {
    
    func didTapPosterNameButton()
    func didTapMoreOptionsButton()
    func didTapLikeButton()
    func didTapCommentButton()
    func didTapDMButton()
    func didTapSaveButton()
    func didTapNumberOfLikesButton()
    
}

class PhotoPostViewModel {
    
    let numberOfPosts = ["uno", "due", "tre"] //I don't know how to make infinity scroll system so for now I add only this array to let tableView show anything
    var cellViewModels: [PhotoPostCellViewModel] = [
        PhotoPostCellViewModel(posterName: "Piter", numberOfLikes: "5", description: "photo", timeOfPosting: "12.01.2021"),
        PhotoPostCellViewModel(posterName: "Bartosz", numberOfLikes: "10", description: "my photo", timeOfPosting: "11.02.2021"),
        PhotoPostCellViewModel(posterName: "Raphael", numberOfLikes: "15", description: "the photo of mine", timeOfPosting: "01.02.2021")
    ]
    let delegate: PhotoPostViewModelDelegate?
    
    init(delegate: PhotoPostViewModelDelegate) {
        self.delegate = delegate
    }
}

extension PhotoPostViewModel: PhotoPostCellViewModelDelegate {
    func didTapPosterNameButton() {
        delegate?.didTapPosterNameButton()
    }
    
    func didTapMoreOptionsButton() {
        delegate?.didTapMoreOptionsButton()
    }
    
    func didTapLikeButton() {
        delegate?.didTapLikeButton()
    }
    
    func didTapCommentButton() {
        delegate?.didTapCommentButton()
    }
    
    func didTapDMButton() {
        delegate?.didTapDMButton()
    }
    
    func didTapSaveButton() {
        delegate?.didTapSaveButton()
    }
    
    func didTapNumberOfLikesButton() {
        delegate?.didTapNumberOfLikesButton()
    }
}
