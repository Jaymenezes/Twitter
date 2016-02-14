//
//  TweetsViewController.swift
//  Twitter
//
//  Created by user on 2/13/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {
    
    var tweets: [Tweet]?
    

    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        
        // Do any additional setup after loading the view.
        
        TwitterClient.sharedInstance.homeTImelineWithParams(nil) { (tweets, error) -> () in
            self.tweets = tweets
        }
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
