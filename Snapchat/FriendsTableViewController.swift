//
//  Citrus
//
//  Created by Rashid Goshtasbi on 11/7/15.
//  Copyright © 2015 Developers Academy. All rights reserved.
//


import UIKit
import Parse

class FriendsTableViewController: UITableViewController
{
    var friends = [PFUser]()
    var currentUser: PFUser!
    var friendsRelation: PFRelation!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fetchFriends()
    }
    
    func fetchFriends()
    {
        //download friends from parse
        currentUser = PFUser.currentUser()!
        if let friendsRelation = currentUser["friendsRelation"] as? PFRelation {
            let friendsQuery = friendsRelation.query()
            friendsQuery?.orderByAscending("username")
            friendsQuery?.findObjectsInBackgroundWithBlock({ (friends, error) -> Void in
                if error == nil {
                    self.friends = friends as! [PFUser]
                    self.tableView.reloadData()
                }
                else
                {
                    print (error)
                }
            })
            
        }
        else
        {
            print("error")
        }
    }
    
    // MARK UITableViewDataSource
    
    struct Storyboard{
        static let CellIdentifier = "Friend Cell"
        static let ShowEditFriendsSegue = "Show Edit Friends"
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath)
        let friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.username
        
        return cell
    }
}



















