//
//  Friends.swift
//  FriendsApp
//
//  Created by David Jardon on 23/11/20.
//

import Foundation

class Friends {
    // Singleton
    static let shared = Friends()
    private init() { }
    
    var friends: [Friend] = []
}
