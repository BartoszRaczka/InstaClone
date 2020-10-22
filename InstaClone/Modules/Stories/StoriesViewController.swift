//
//  StoriesViewController.swift
//  InstaClone
//
//  Created by MacBook on 22/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit

final class StoriesViewController: UIViewController {
    
    init(with viewModel: StoriesViewModel) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
