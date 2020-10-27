//
//  StoriesView.swift
//  InstaClone
//
//  Created by MacBook on 22/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import SnapKit

final class StoriesView: UIView, UICollectionViewDelegateFlowLayout {
    
    private let viewModel: StoriesViewModel
    private var collectionView: UICollectionView!
    
    init(with viewModel: StoriesViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.scrollDirection = .horizontal
                
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
        collectionView.allowsSelection = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .none
                
        collectionView.dataSource = self
        collectionView.delegate = self
                
        addSubview(collectionView)
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension StoriesView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 //Amount will be taken from viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath)
        (cell as? StoriesCollectionViewCell)?.update(with: UIImage()) // UIImage will be taken from set viewmodel.images[indexPath.row]
        return cell
    }

}
