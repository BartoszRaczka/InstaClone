//
//  ProfilePageView.swift
//  InstaClone
//
//  Created by new on 01/11/2020.
//

import SnapKit

class ProfilePageView: UIView {
    
    let viewModel: ProfilePageViewModel
    
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
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Objective-C methods
    @objc func didTapUserProfilePictureButton() {
        viewModel.didTapUserProfilePictureButton()
    }
    
    @objc func didTapNumberOfPostsButton() {
        viewModel.didTapNumberOfPostsButton()
    }
    
    @objc func didTapNumberOfFollowersButton() {
        viewModel.didTapNumberOfFollowersButton()
    }
    
    @objc func didTapNumberOfFollowingButton() {
        viewModel.didTapNumberOfFollowingButton()
    }
    
    @objc func didTapEditProfileButton() {
        viewModel.didTapEditProfileButton()
    }
    
}

//MARK: -View setup
private extension ProfilePageView {
    
    //MARK: User profile picture setup
    func setupUserProfilePictureButton() {
        userProfilePictureButton = UIButton()
        addSubview(userProfilePictureButton)
        
        userProfilePictureButton.addTarget(self, action: #selector(didTapUserProfilePictureButton), for: .touchUpInside)
        
        userProfilePictureButton.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.width.equalTo(64.0)
        }
    }
    
    //MARK: NumbersStackView setup
    func setupNumberOfPostsButton() {
        numberOfPostsButton = UIButton()
        addSubview(numberOfPostsButton)
        
        numberOfPostsButton.addTarget(self, action: #selector(didTapNumberOfPostsButton), for: .touchUpInside)
        
        let label = UILabel()
        label.text = "Posts"
        label.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        let number = UILabel()
        number.text = String(viewModel.numberOfPosts)
        number.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        numberOfPostsButton.addSubview(number)
        numberOfPostsButton.addSubview(label)
    }
    
    func setupNumberOfFollowersButton() {
        numberOfFollowersButton = UIButton()
        addSubview(numberOfFollowersButton)
        
        numberOfFollowersButton.addTarget(self, action: #selector(didTapNumberOfFollowersButton), for: .touchUpInside)
        
        let label = UILabel()
        label.text = "Followers"
        label.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        let number = UILabel()
        number.text = String(viewModel.numberOfFollowers)
        number.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        numberOfFollowersButton.addSubview(number)
        numberOfFollowersButton.addSubview(label)
    }
    
    func setupNumberOfFollowingButton() {
        numberOfFollowingButton = UIButton()
        addSubview(numberOfFollowingButton)
        
        numberOfFollowingButton.addTarget(self, action: #selector(didTapNumberOfFollowingButton), for: .touchUpInside)
        
        let label = UILabel()
        label.text = "Following"
        label.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        let number = UILabel()
        number.text = String(viewModel.numberOfFollowing)
        number.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        numberOfFollowingButton.addSubview(number)
        numberOfFollowingButton.addSubview(label)
    }
    
    func setupNumbersStackView() {
        numbersStackView = UIStackView()
        addSubview(numbersStackView)
        numbersStackView.distribution = .fillEqually
        
        numbersStackView.snp.makeConstraints { make in
            make.leading.equalTo(userProfilePictureButton.snp.trailing)
            make.top.trailing.equalToSuperview()
        }
        
        setupNumberOfPostsButton()
        setupNumberOfFollowersButton()
        setupNumberOfFollowingButton()
        
        numbersStackView.addArrangedSubview(numberOfPostsButton)
        numbersStackView.addArrangedSubview(numberOfFollowersButton)
        numbersStackView.addArrangedSubview(numberOfFollowingButton)
    }
    
    //MARK: Description and edit profile button setup
    func setupDescriptionLabel() {
        descriptionLabel = UILabel()
        addSubview(descriptionLabel)
        
        descriptionLabel.text = viewModel.descriptionLabelText
        
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
        
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
}

//MARK: CollectionView setup
extension ProfilePageView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private func setupPostedPhotosCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 161.8)
        layout.scrollDirection = .horizontal
        
        postedPhotosCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        postedPhotosCollectionView.register(PostedPhotoCell.self, forCellWithReuseIdentifier: "PostedPhotoCell")
        postedPhotosCollectionView.allowsSelection = true
        postedPhotosCollectionView.showsHorizontalScrollIndicator = false
        postedPhotosCollectionView.backgroundColor = .none
        
        postedPhotosCollectionView.dataSource = self
        postedPhotosCollectionView.delegate = self
        
        addSubview(postedPhotosCollectionView)
        
        postedPhotosCollectionView.snp.makeConstraints { make in
            make.top.equalTo(editProfileButton)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfPosts
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postedPhotosCollectionView.dequeueReusableCell(withReuseIdentifier: "PostedPhotoCell", for: indexPath)
        return cell
    }
    
}
