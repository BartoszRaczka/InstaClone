//
//  PostedPhotoCell.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//

import SnapKit

class PostedPhotoCell: UICollectionViewCell {
    
    var postedPhoto: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupPostedPhoto()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupPostedPhoto() {
        let image = UIImage() //TODO: create right image
        postedPhoto = UIImageView(image: image)
        addSubview(postedPhoto)
        
        postedPhoto.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.width.equalTo(64)
        }
    }
    
}
