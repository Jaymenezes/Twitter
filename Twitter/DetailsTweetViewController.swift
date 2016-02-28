//
//  DetailsTweetViewController.swift
//  Twitter
//
//  Created by user on 2/24/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class DetailsTweetViewController: UIViewController {
    
    var tweet: Tweet!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var timeCreatedLabel: UILabel!
    
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favCountLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var tweetID: String = ""
        
        tweetContent.text = tweet?.text
        userNameLabel.text = tweet?.user!.name
        
        authorLabel.text = "@\(tweet!.user!.screenname!)"
        timeCreatedLabel.text = calculateTimeStamp((tweet?.createdAt!.timeIntervalSinceNow)!)
        profileImageView.setImageWithURL(NSURL(string: (tweet?.user?.profileImageUrl)!)!)
        
        tweetID = (tweet?.id)!
        retweetCountLabel.text = String(tweet!.retweetTotal!)
        favCountLabel.text = String(tweet!.favTotal!)
        
        
        
        
        
    

}


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   
    }
    
    
    
    func calculateTimeStamp(timeTweetPostedAgo: NSTimeInterval) -> String {
        // Turn timeTweetPostedAgo into seconds, minutes, hours, days, or years
        var rawTime = Int(timeTweetPostedAgo)
        var timeAgo: Int = 0
        var timeChar = ""
        
        rawTime = rawTime * (-1)
        
        // Figure out time ago
        if (rawTime <= 60) { // SECONDS
            timeAgo = rawTime
            timeChar = "s"
        } else if ((rawTime/60) <= 60) { // MINUTES
            timeAgo = rawTime/60
            timeChar = "m"
        } else if (rawTime/60/60 <= 24) { // HOURS
            timeAgo = rawTime/60/60
            timeChar = "h"
        } else if (rawTime/60/60/24 <= 365) { // DAYS
            timeAgo = rawTime/60/60/24
            timeChar = "d"
        } else if (rawTime/(3153600) <= 1) { // YEARS
            timeAgo = rawTime/60/60/24/365
            timeChar = "y"
        }
        
        return "\(timeAgo)\(timeChar)"
    }
    
    
    


    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {


        if (segue.identifier) == "SegueToReply" {
            let user = User.currentUser
            let tweet = self.tweet!
            
            let composeViewController = segue.destinationViewController as! ComposeViewController
            
            composeViewController.user = user
            composeViewController.tweet = tweet
            composeViewController.author = (user?.screenname)
            composeViewController.isReply = true
        } else {
            
        }
        
        
    
    }
}