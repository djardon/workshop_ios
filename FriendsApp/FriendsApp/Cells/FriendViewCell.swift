//
//  FriendViewCell.swift
//  FriendsApp
//
//  Created by David Jardon on 23/11/20.
//

import UIKit

class FriendViewCell: UITableViewCell {
    @IBOutlet var friendImage: UIImageView?
    @IBOutlet var name: UILabel?
    @IBOutlet var lastname: UILabel?
    @IBOutlet var levelValue: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    func configureViews(friend: Friend) {
        friendImage?.image = friend.image
        name?.text = friend.name
        lastname?.text = friend.lastname
        levelValue?.text = String(format: "%.1f", friend.level)
    }
}
