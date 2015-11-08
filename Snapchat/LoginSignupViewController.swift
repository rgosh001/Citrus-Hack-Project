//
//  Citrus
//
//  Created by Rashid Goshtasbi on 11/7/15.
//  Copyright © 2015 Developers Academy. All rights reserved.
//


import UIKit
import Parse
import ParseUI

class LoginSignupViewController: PFLogInViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        title = "Citus Hack"
        
        let signUpVC = PFSignUpViewController()
        signUpVC.delegate = self
        self.delegate = self
        self.signUpController = signUpVC
        
        //out own logo
        logInView?.logo = UIImageView(image: UIImage(named: "equipo logo")!)
        logInView?.logo?.contentMode = .ScaleAspectFill
        
        
        signUpVC.signUpView?.logo = UIImageView(image: UIImage(named: "equipo logo")!)
        signUpVC.signUpView?.logo?.contentMode = .ScaleAspectFit

    }
    
    func showInbox()
    {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}

extension LoginSignupViewController : PFSignUpViewControllerDelegate
{
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        dismissViewControllerAnimated(true, completion: nil)
        showInbox()
    }
}

extension LoginSignupViewController : PFLogInViewControllerDelegate
{
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        showInbox()
    }
}




























