//
//  PostedPhotoCell.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//

import SnapKit

class PostedPhotoCell: UICollectionViewCell {
    
    var postedPhoto: UIImageView!
    var viewModel: PostedPhotoCellViewModel! {
        didSet {
            updateCellData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupPostedPhoto()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupPostedPhoto() {
        postedPhoto = UIImageView()
        addSubview(postedPhoto)
        
        postedPhoto.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.width.equalTo(64)
        }
    }
    
    private func updateCellData() {
//        postedPhoto.image = UIImage(named: viewModel.imageNames.first!)
        postedPhoto.image = UIImage(data: viewModel.imageData)
    }
    
}
