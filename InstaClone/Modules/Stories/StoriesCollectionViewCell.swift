//
//  StoriesCollectionViewCell.swift
//  InstaClone
//
//  Created by MacBook on 23/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import SnapKit

final class StoriesCollectionViewCell: UICollectionViewCell {
    
    private var image: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with image: UIImage) {
        self.image.image = image // do poprawienia w razie czego
    }
    
    private func setupImage() {
        image = UIImageView()
        addSubview(image)
        
        image.snp.makeConstraints{ (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            image.layer.cornerRadius = image.bounds.size.height / 2
        }
    }
    
}
