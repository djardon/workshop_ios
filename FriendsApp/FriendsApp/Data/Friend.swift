//
//  Friend.swift
//  FriendsApp
//
//  Created by David Jardon on 23/11/20.
//

import UIKit

class Friend {
    var image: UIImage? = nil
    var name: String = ""
    var lastname: String = ""
    var level: Float = 0.0
    
    init(image: UIImage?, name: String, lastname: String, level: Float) {
        self.image = image
        self.name = name
        self.lastname =  lastname
        self.level = level
    }
}
