//
//  ProfileViewController.swift
//  Twitter
//
//  Created by user on 2/28/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    
    var user: User!
    var tweet: Tweet!

    
    @IBOutlet weak var userBannerImageView: UIImageView!
    @IBOutlet weak var profilePageImageView: UIImageView!
    @IBOutlet weak var profilePageUserNameLabel: UILabel!
    @IBOutlet weak var profilePageAuthorLabel: UILabel!
    
    @IBOutlet weak var tweetsCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    
    
    

    override func viewDidLoad() {
        print("seguetoProfileWorking")
//        profilePageImageView.setImageWithURL(NSURL(string: (tweet?.user?.profileImageUrl)!)!)
//        profilePageUserNameLabel.text = tweet.user!.name
//        profilePageAuthorLabel.text = "@" + (tweet?.user?.screenname!)!
        tweetsCountLabel.text = String(user!.statusesCount)
        followingCountLabel.text = String(user!.followingCount)
        followersCountLabel.text = String(user!.followersCount)
////
        let userID = user?.userID
        let banner = TwitterClient.sharedInstance.getUserBanner(userID!, params: nil) { (error) -> () in
        
        }

        print("banner for \(user!.name!) is here: \(banner)")

     
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
