//
//  Citrus
//
//  Created by Rashid Goshtasbi on 11/7/15.
//  Copyright © 2015 Developers Academy. All rights reserved.
//


import UIKit
import Parse

class InboxViewController: UITableViewController
{
    struct storyboard {
        static let ShowLoginSegue = "Show Log In"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if PFUser.currentUser() == nil
        {
            performSegueWithIdentifier(storyboard.ShowLoginSegue, sender: nil)
        }
    }
    
    // 
    @IBAction func logOutDidTap(sender: AnyObject)
    {
        PFUser.logOut()
        self.performSegueWithIdentifier(storyboard.ShowLoginSegue, sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == storyboard.ShowLoginSegue
        {
            let LoginSignupVC = segue.destinationViewController as! LoginSignupViewController
            LoginSignupVC.hidesBottomBarWhenPushed = true
            LoginSignupVC.navigationItem.hidesBackButton = true
        }
    }
}

























