//
//  PhotoPostTableViewCellViewModel.swift
//  InstaClone
//
//  Created by new on 22/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation

protocol PhotoPostCellViewModelDelegate: AnyObject {
    
    func didTapPosterNameButton()
    func didTapMoreOptionsButton()
    func didTapLikeButton()
    func didTapCommentButton()
    func didTapDMButton()
    func didTapSaveButton()
    func didTapNumberOfLikesButton()
    
}

final class PhotoPostCellViewModel {
    
    var delegate: PhotoPostCellViewModelDelegate?
    
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
