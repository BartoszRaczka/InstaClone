//
//  PostedPhotoCellViewModel.swift
//  InstaClone
//
//  Created by new on 03/11/2020.
//
import Foundation

final class PostedPhotoCellViewModel {
   
    var imageNames: [String] = ["stonoga"]
    var imageData: Data
    
    init(imageData: Data) {
        self.imageData = imageData
    }
}
