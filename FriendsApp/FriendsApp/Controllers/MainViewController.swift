//
//  MainViewController.swift
//  FriendsApp
//
//  Created by David Jardon on 23/11/20.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let friend = sender as? Friend,
           let destination = segue.destination as? DetailViewController {
            destination.friend = friend
        }
    }
}

// UITableView delegate and dataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Friends.shared.friends.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendViewCell",
                                                 for: indexPath) as? FriendViewCell
        
        if(indexPath.row < Friends.shared.friends.count) {
            cell?.configureViews(friend: Friends.shared.friends[indexPath.row])
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < Friends.shared.friends.count) {
            performSegue(withIdentifier: "MAIN_FRIENDS_SELECTED",
                         sender: Friends.shared.friends[indexPath.row])
        }
    }
}
