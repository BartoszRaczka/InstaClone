//
//  UserProfileService.swift
//  InstaClone
//
//  Created by MacBook on 22/10/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import Firebase

protocol UserProfileServiceProtocol {
    func getData(user: UserData)
    func setData(user: UserData)
}

final class UserProfileService: UserProfileServiceProtocol {
        
    func getData(user: UserData) {
        reference.child("users/\(user.id)").observeSingleEvent(of: .value) { [weak self] snapshot in
            guard
                let self = self,
                JSONSerialization.isValidJSONObject(snapshot.value as Any),
                let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any),
                let user = try? JSONDecoder().decode(User.self, from: data)
            else {
                return
            }
            // rest of the logic
        }
    }
    
    func setData(user: UserData) {
        let userData = try! JSONEncoder().encode(user)
        let userJSON = try! JSONSerialization.jsonObject(with: userData, options: [])

        let reference = Database.database().reference(withPath: "users/\(user.id)")
        reference.setValue(userJSON) { error, reference in
            // rest of the logic
        }
    }
    
}
