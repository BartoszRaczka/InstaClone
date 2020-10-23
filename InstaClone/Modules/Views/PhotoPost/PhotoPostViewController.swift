//
//  PhotoPostViewController.swift
//  InstaClone
//
//  Created by new on 23/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit

class PhotoPostViewController: UIViewController {
    
}

////Method I wanted to add in CoordinatorFactory
//    func makePhotoPostCoordinator(
//        with navigationController: UINavigationController,
//        dependencyContainer: DependencyContainer
//    ) -> {
//        PhotoPostCoordinator(
//            with: navigationController,
//            dependencyContainer: dependencyContainer
//        )
//    }


////Method I wanted to add in AppCoordinator
//private func startFromPhotoPost() {
//    let navigationController = UINavigationController() //I think this line is unnesessary because navi-contr have been created in startFromTabBar method and maybe we should make one navi-contr for every method?
//    let coordinator = dependencyContainer.makePhotoPostCoordinator(
//        with: navigationController,
//        dependencyContainer: dependencyContainer
//    )
//    coordinators.append(coordinator)
//    coordinator.start()
//
//    window.rootViewController = navigationController //I think this line is unnecessary too
//}

////call this method in func start with this line:
//startFromPhotoPost()
