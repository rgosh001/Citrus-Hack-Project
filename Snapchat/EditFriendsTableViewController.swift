//
//  Citrus
//
//  Created by Rashid Goshtasbi on 11/7/15.
//  Copyright © 2015 Developers Academy. All rights reserved.
//


import UIKit
import Parse

class EditFriendsTableViewController: UITableViewController
{
    var friends = [PFUser]()
    private var users = [PFUser]()
    private var currentUser = PFUser.currentUser() //current user's account
    
    struct Storyboard{
        static let CellIdentifier = "Friend Cell"
    }
    
    
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Friends"
        
        fetchUsers()
        
    }
    
    private func fetchUsers()
    {
        //to download stuff from parse, use query
        let userQuery = PFUser.query()
        userQuery?.orderByAscending("username") //returns array of results
        userQuery?.findObjectsInBackgroundWithBlock({ (users, error) -> Void in
            if error == nil {
                self.users = users as! [PFUser]
                self.tableView.reloadData()
            }
            else {
                print (error)
            }
        })
    }
    
    // MARK - UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath)
        
        let user = self.users[indexPath.row]
        cell.textLabel?.text = user.username
        
        return cell
    }
    
    // MARK - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let user = self.users[indexPath.row]
        let friendsRelation = currentUser?.relationForKey("friendsRelation")
        
        friendsRelation?.addObject(user)
        currentUser?.saveInBackgroundWithBlock{ (success, error) -> Void in
            if error != nil {
                print(error)
            }
        }
    }
}


































