//
//  PhotoPostTableViewCell.swift
//  InstaClone
//
//  Created by new on 20/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit

class PhotoPostTableViewCell: UITableViewCell {
    
    var headContainer: UIView!
    var posterPhoto: UIImageView!
    var posterName: UIButton!
    var moreOptionsButton: UIButton!
    var postedPhoto: UIImageView!
    var feetContainer: UIView!//done
    var likeIcon: UIButton!
    var commentIcon: UIButton!
    var dmIcon: UIButton!
    var saveIcon: UIButton!
    var numberOfLikes: UIButton!
    var postDescription: UILabel!
    var postComment: UITextField!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHeadContainer()
        setupPosterPhoto()
        setupMoreOptionsButton()
        setupPosterName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - HeadContainer
    private func setupHeadContainer() {
        headContainer = UIView()
        addSubview(headContainer)
        
        headContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            headContainer.topAnchor.constraint(equalTo: topAnchor),
            headContainer.heightAnchor.constraint(equalToConstant: 32.0),
            headContainer.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupPosterPhoto() {
        posterPhoto = UIImageView()
        addSubview(posterPhoto)
        
        posterPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterPhoto.leadingAnchor.constraint(equalTo: headContainer.leadingAnchor),
            posterPhoto.topAnchor.constraint(equalTo: headContainer.topAnchor),
            posterPhoto.bottomAnchor.constraint(equalTo: headContainer.bottomAnchor),
            posterPhoto.widthAnchor.constraint(equalTo: headContainer.heightAnchor)
        ])
    }
    
    private func setupMoreOptionsButton() {
        moreOptionsButton = UIButton()
        addSubview(moreOptionsButton)
        
        moreOptionsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moreOptionsButton.widthAnchor.constraint(equalTo: headContainer.heightAnchor),
            moreOptionsButton.topAnchor.constraint(equalTo: headContainer.topAnchor),
            moreOptionsButton.bottomAnchor.constraint(equalTo: headContainer.bottomAnchor),
            moreOptionsButton.trailingAnchor.constraint(equalTo: headContainer.trailingAnchor)
        ])
    }
    
    private func setupPosterName() {
        posterName = UIButton()
        addSubview(posterName)
        posterName.titleLabel?.text = "Poster Name"
        
        posterName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterName.leadingAnchor.constraint(equalTo: posterPhoto.trailingAnchor),
            posterName.topAnchor.constraint(equalTo: headContainer.topAnchor),
            posterName.bottomAnchor.constraint(equalTo: headContainer.bottomAnchor),
            posterName.trailingAnchor.constraint(equalTo: moreOptionsButton.leadingAnchor)
        ])
    }
    
// MARK: - PostedPhoto
    private func setupPostedPhoto() {
        postedPhoto = UIImageView()
        addSubview(postedPhoto)
        
        postedPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postedPhoto.leadingAnchor.constraint(equalTo: leadingAnchor),
            postedPhoto.topAnchor.constraint(equalTo: headContainer.bottomAnchor),
            postedPhoto.trailingAnchor.constraint(equalTo: trailingAnchor)
            // bottom zdefiniowane przez rozmiary wrzuconego zdjecia
        ])
    }

// MARK: - FeetContainer
    private func setupFeetContainer() {
        feetContainer = UIView()
        addSubview(feetContainer)
        
        feetContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feetContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            feetContainer.topAnchor.constraint(equalTo: postedPhoto.bottomAnchor),
            feetContainer.trailingAnchor.constraint(equalTo: trailingAnchor)
            //bottom zdefiniowane przez zawartosc containera
        ])
    }
    
    private func setupLikeIcon() {
        
    }
}


