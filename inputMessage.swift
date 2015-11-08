//
//  Citrus
//
//  Created by Rashid Goshtasbi on 11/7/15.
//  Copyright © 2015 Developers Academy. All rights reserved.
//

import UIKit

class inputMessage: UIViewController {

    @IBOutlet weak var sendTo: UITextField!
    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var clickHereToSend: UIButton!
    @IBOutlet weak var saySent: UILabel!
    @IBAction func SendMessage(sender: AnyObject) {
        saySent.text = "Sent"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
