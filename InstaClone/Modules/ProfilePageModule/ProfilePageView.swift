//
//  ProfilePageView.swift
//  InstaClone
//
//  Created by new on 01/11/2020.
//

import SnapKit

final class ProfilePageView: UIView {
    
    private let viewModel: ProfilePageViewModel
    
    private var userProfilePictureButton: UIButton!
    private var numbersStackView: UIStackView!
    private var numberOfPostsButton: UIButton!
    private var numberOfFollowersButton: UIButton!
    private var numberOfFollowingButton: UIButton!
    private var descriptionLabel: UILabel!
    private var editProfileButton: UIButton!
    private var postedPhotosCollectionView: UICollectionView!
    
    init(with viewModel: ProfilePageViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupUserProfilePictureButton()
        setupNumbersStackView()
        setupDescriptionLabel()
        setupEditProfileButton()
        setupPostedPhotosCollectionView()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Private methods
    
    @objc private func didTapUserProfilePictureButton() {
        viewModel.didTapUserProfilePictureButton()
    }
    
    @objc private func didTapNumberOfPostsButton() {
        viewModel.didTapNumberOfPostsButton()
    }
    
    @objc private func didTapNumberOfFollowersButton() {
        viewModel.didTapNumberOfFollowersButton()
    }
    
    @objc private func didTapNumberOfFollowingButton() {
        viewModel.didTapNumberOfFollowingButton()
    }
    
    @objc private func didTapEditProfileButton() {
        viewModel.didTapEditProfileButton()
    }
    
}

// MARK: - View setup

private extension ProfilePageView {
    
    func setupUserProfilePictureButton() {
        userProfilePictureButton = UIButton()
        addSubview(userProfilePictureButton)
        userProfilePictureButton.setImage(UIImage(named: "defaultProfilePicture"), for: .normal)
        
        userProfilePictureButton.addTarget(self, action: #selector(didTapUserProfilePictureButton), for: .touchUpInside)
        
        userProfilePictureButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalToSuperview()
            make.height.width.equalTo(64.0)
        }
    }
    
    func setupNumberOfPostsButton() {
        numberOfPostsButton = UIButton()
        addSubview(numberOfPostsButton)
        
        numberOfPostsButton.addTarget(self, action: #selector(didTapNumberOfPostsButton), for: .touchUpInside)
        
        let number = UILabel()
        number.text = String(viewModel.numberOfPosts)
        number.font = UIFont.systemFont(ofSize: 24.0)
        number.textAlignment = .center
        numberOfPostsButton.addSubview(number)
        
        number.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        let label = UILabel()
        label.text = "Posts"
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .center
        numberOfPostsButton.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(number.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupNumberOfFollowersButton() {
        numberOfFollowersButton = UIButton()
        addSubview(numberOfFollowersButton)
        
        numberOfFollowersButton.addTarget(self, action: #selector(didTapNumberOfFollowersButton), for: .touchUpInside)
        
        let number = UILabel()
        number.text = String(viewModel.numberOfFollowers)
        number.font = UIFont.systemFont(ofSize: 24.0)
        number.textAlignment = .center
        numberOfFollowersButton.addSubview(number)
        
        number.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        let label = UILabel()
        label.text = "Followers"
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .center
        numberOfFollowersButton.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(number.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupNumberOfFollowingButton() {
        numberOfFollowingButton = UIButton()
        addSubview(numberOfFollowingButton)
        
        numberOfFollowingButton.addTarget(self, action: #selector(didTapNumberOfFollowingButton), for: .touchUpInside)
        
        let number = UILabel()
        number.text = String(viewModel.numberOfFollowing)
        number.font = UIFont.systemFont(ofSize: 24.0)
        number.textAlignment = .center
        numberOfFollowingButton.addSubview(number)
        
        number.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        let label = UILabel()
        label.text = "Following"
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .center
        numberOfFollowingButton.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(number.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupNumbersStackView() {
        numbersStackView = UIStackView()
        addSubview(numbersStackView)
        numbersStackView.distribution = .fillEqually
        numbersStackView.axis = .horizontal
        
        numbersStackView.snp.makeConstraints { make in
            make.leading.equalTo(userProfilePictureButton.snp.trailing)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.trailing.equalToSuperview()
        }
        
        setupNumberOfPostsButton()
        setupNumberOfFollowersButton()
        setupNumberOfFollowingButton()
        
        numbersStackView.addArrangedSubview(numberOfPostsButton)
        numbersStackView.addArrangedSubview(numberOfFollowersButton)
        numbersStackView.addArrangedSubview(numberOfFollowingButton)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel = UILabel()
        addSubview(descriptionLabel)
        
        descriptionLabel.text = viewModel.descriptionLabelText
        descriptionLabel.textAlignment = .center
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userProfilePictureButton.snp.bottom)
        }
    }
    
    func setupEditProfileButton() {
        editProfileButton = UIButton()
        addSubview(editProfileButton)
        
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
        
        editProfileButton.setTitle("Edit Profile", for: .normal)
        editProfileButton.setTitleColor(.black, for: .normal)
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: CollectionView setup

extension ProfilePageView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private func setupPostedPhotosCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.scrollDirection = .vertical
        
        postedPhotosCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        postedPhotosCollectionView.register(PostedPhotoCell.self, forCellWithReuseIdentifier: "PostedPhotoCell")
        postedPhotosCollectionView.allowsSelection = true
        postedPhotosCollectionView.showsHorizontalScrollIndicator = false
        postedPhotosCollectionView.backgroundColor = .none
        
        postedPhotosCollectionView.dataSource = self
        postedPhotosCollectionView.delegate = self
        
        addSubview(postedPhotosCollectionView)
        
        postedPhotosCollectionView.snp.makeConstraints { make in
            make.top.equalTo(editProfileButton.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photoList.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postedPhotosCollectionView.dequeueReusableCell(withReuseIdentifier: "PostedPhotoCell", for: indexPath)
        let imageData = viewModel.photoList.photos[indexPath.row]
        (cell as? PostedPhotoCell)?.viewModel = PostedPhotoCellViewModel(imageData: imageData)
        return cell
    }
    
}
