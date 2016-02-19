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
    
    
    var tweetID: String = ""

    var tweet: Tweet! {
        didSet{
            
            

            tweetContent.text = tweet.text
            authorLabel.text = "@\(tweet.user!.screenname!)"

            userNameLabel.text = tweet.user?.name!
            timeCreatedLabel.text = tweet.createdAtString!
            profileImageView.setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!)!)
            
            tweetID = tweet.id
            retweetCountLabel.text = String(tweet.retweetTotal!)
            favCountLabel.text = String(tweet.favTotal!)
            
            
            
//            profileImageView.setImageWithURL(tweet.user?.profileImageUrl!)
            
//            profileImageView.setImageWithURL(tweet.user!.profileImageUrl!)

            
//            favCountLabel.text = tweet.favTotal as! Int
//            retweetCountLabel.text = tweet.retweetTotal as! Int
    
            
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = 5
        profileImageView.clipsToBounds = true
        userNameLabel.preferredMaxLayoutWidth = userNameLabel.frame.size.width
        
        
        // Initialization code
    }
    

}
