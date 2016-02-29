//
//  TweetsTableViewCell.swift
//  Twitter
//
//  Created by user on 2/13/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit
import AFNetworking


class TweetsTableViewCell: UITableViewCell {
    
    


  

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeCreatedLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favCountLabel: UILabel!
    
    

    var toggleFavorite = 1
    var toggleRetweet = 2
    
    
    var tweetID: String = ""

    var tweet: Tweet! {
        didSet{
            
            

            tweetContent.text = tweet.text
            authorLabel.text = "@\(tweet.user!.screenname!)"

            userNameLabel.text = tweet.user?.name!
            timeCreatedLabel.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow)
            profileImageView.setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!)!)
            
            tweetID = tweet.id
            retweetCountLabel.text = String(tweet.retweetTotal!)
            favCountLabel.text = String(tweet.favTotal!)
            
            
//            Dylan's method
            
            if NSUserDefaults.standardUserDefaults().boolForKey("toggleRetweet"+tweet.id){
                retweetButton.setImage(UIImage(named: "retweet-action-on-green"), forState: UIControlState.Normal)
                retweetCountLabel.textColor = UIColor(red: 0x19/255, green: 0xcf/255, blue: 0x86/255, alpha: 1.0)
                //                count text mockup
                retweetCountLabel.text = String(Int(tweet.retweetTotal!) + 1)
            }else{
                
                retweetButton.setImage(UIImage(named: "retweet-action_default"), forState: UIControlState.Normal)
                retweetCountLabel.textColor = UIColor(red: 0xaa/255, green: 0xb8/255, blue: 0xc2/255, alpha: 1.0)
            }
            
            //            check if favorite button and text is "on"
            if NSUserDefaults.standardUserDefaults().boolForKey("toggleFavorite"+tweet.id){
                favButton.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Normal)
                favCountLabel.textColor = UIColor(red: 0xe8/255, green: 0x1c/255, blue: 0x4f/255, alpha: 1.0)
                //                count text mockup
                favCountLabel.text = String(Int(tweet.favTotal!) + 1)
            }else{
                favButton.setImage(UIImage(named: "like-action-off"), forState: UIControlState.Normal)
                favCountLabel.textColor = UIColor(red: 0xaa/255, green: 0xb8/255, blue: 0xc2/255, alpha: 1.0)
            }
            
            //          hide count text if 0
            retweetCountLabel.text! == "0" ? (retweetCountLabel.hidden = true) : (retweetCountLabel.hidden = false)
            favCountLabel.text! == "0" ? (favCountLabel.hidden = true) : (favCountLabel.hidden = false)
            
        }
    }
    
    //All credit for this method goes to David Wayman, slack @dwayman and Monte Thakkar
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
    
    
    @IBAction func onFavClicked(sender: AnyObject) {
        
        if NSUserDefaults.standardUserDefaults().boolForKey("toggleFavorite"+tweet.id) {
            favButton.setImage(UIImage(named: "like-action-off"), forState: UIControlState.Normal)
            favCountLabel.textColor =  UIColor(red: 0xaa/255, green: 0xb8/255, blue: 0xc2/255, alpha: 1.0)
            favCountLabel.text = String(tweet.favTotal!)
            favCountLabel.text! == "0" ? (favCountLabel.hidden = true) : (favCountLabel.hidden = false)
            //            print(">>> toggle faviorite off -1")
            NSUserDefaults.standardUserDefaults().setBool(false, forKey:"toggleFavorite"+tweet.id)
        }else{
            favButton.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Normal)
            favCountLabel.textColor =  UIColor(red: 0xe8/255, green: 0x1c/255, blue: 0x4f/255, alpha: 1.0)
            favCountLabel.text = String(Int(tweet.favTotal!) + 1)
            favCountLabel.hidden = false
            //            print(">>> toggle faviorite on +1")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey:"toggleFavorite"+tweet.id)
        }
    }
    
    
    @IBAction func onRetweetClicked(sender: AnyObject) {
        NSLog(">>>onRetweet")
        if NSUserDefaults.standardUserDefaults().boolForKey("toggleRetweet"+tweet.id) {
            retweetButton.setImage(UIImage(named: "retweet-action_default"), forState: UIControlState.Normal)
            retweetCountLabel.textColor =  UIColor(red: 0xaa/255, green: 0xb8/255, blue: 0xc2/255, alpha: 1.0)
            retweetCountLabel.text = String(tweet.retweetTotal!)
            retweetCountLabel.text! == "0" ? (retweetCountLabel.hidden = true) : (retweetCountLabel.hidden = false)
            //            print(">>> toggle retwee off (-1)")
            NSUserDefaults.standardUserDefaults().setBool(false, forKey:"toggleRetweet"+tweet.id)
        }else{
            retweetButton.setImage(UIImage(named: "retweet-action-on-green"), forState: UIControlState.Normal)
            retweetCountLabel.textColor =  UIColor(red: 0x19/255, green: 0xcf/255, blue: 0x86/255, alpha: 1.0)
            retweetCountLabel.text = String(Int(tweet.retweetTotal!) + 1)
            retweetCountLabel.hidden = false
            //            print(">>> toggle retweet on (+1)")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey:"toggleRetweet"+tweet.id)
        
    }
    
    
}


    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = 5
        profileImageView.clipsToBounds = true
        
        userNameLabel.preferredMaxLayoutWidth = userNameLabel.frame.size.width
        tweetContent.preferredMaxLayoutWidth = tweetContent.frame.size.width
        userNameLabel.preferredMaxLayoutWidth = userNameLabel.frame.size.width
        authorLabel.preferredMaxLayoutWidth = authorLabel.frame.size.width
        timeCreatedLabel.preferredMaxLayoutWidth = timeCreatedLabel.frame.size.width
        
        
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    

}
