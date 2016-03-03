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
    var tweet: Tweet?
    
    

    
    @IBOutlet weak var userBannerImageView: UIImageView!
    @IBOutlet weak var profilePageImageView: UIImageView!
    @IBOutlet weak var profilePageUserNameLabel: UILabel!
    @IBOutlet weak var profilePageAuthorLabel: UILabel!
    
    @IBOutlet weak var tweetsCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    
    
    

    override func viewDidLoad() {
//        print("seguetoProfileWorking")
        
        profilePageImageView.layer.cornerRadius = 5
        profilePageImageView.clipsToBounds = true
        profilePageUserNameLabel.preferredMaxLayoutWidth = profilePageUserNameLabel.frame.size.width
        profilePageAuthorLabel.preferredMaxLayoutWidth = profilePageAuthorLabel.frame.size.width
        followersCountLabel.preferredMaxLayoutWidth = followersCountLabel.frame.size.width
        followingCountLabel.preferredMaxLayoutWidth = followingCountLabel.frame.size.width
        tweetsCountLabel.preferredMaxLayoutWidth = tweetsCountLabel.frame.size.width
        
        
//        print(tweet!.user?.name)
        
        if tweet != nil {
            
            profilePageImageView.setImageWithURL(NSURL(string: (tweet!.user?.profileImageUrl)!)!)
            profilePageUserNameLabel.text = tweet!.user?.name
            profilePageAuthorLabel.text = tweet!.user?.screenname
            tweetsCountLabel.text = String(tweet!.user!.followersCount)
            followingCountLabel.text = String(tweet!.user!.followingCount)
            followersCountLabel.text = (String(tweet!.user!.followersCount))
            if (tweet!.user?.profileBanner != nil){
                let imageUrl = tweet!.user?.profileBanner!
                userBannerImageView.setImageWithURL(NSURL( string: imageUrl!)!)
            }
                
            else{
                print("didn't get banner")
                
            }
            
            
        }
        
        if user != nil {
            
            profilePageUserNameLabel.text = User.currentUser!.name!
            profilePageAuthorLabel.text = "@" + (User.currentUser!.screenname!)
            profilePageImageView.setImageWithURL(NSURL(string: (User.currentUser?.profileImageUrl!)!)!)
            tweetsCountLabel.text = String(user!.statusesCount)
            followingCountLabel.text = String(user!.followingCount)
            followersCountLabel.text = String(user!.followersCount)
            if (User.currentUser!.profileBanner != nil){
                let imageUrl = User.currentUser?.profileBanner!
                userBannerImageView.setImageWithURL(NSURL( string: imageUrl!)!)
            }
                
            else{
                print("didn't get banner")
                
            }
        }
//////
//        let userID = user?.userID
//        let banner = TwitterClient.sharedInstance.getUserBanner(userID!, params: nil) { (error) -> () in
//
//        }
//
//        print("banner for \(user!.profileBanner!) is here: \(banner)")

     
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
