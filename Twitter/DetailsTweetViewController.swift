//
//  DetailsTweetViewController.swift
//  Twitter
//
//  Created by user on 2/24/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class DetailsTweetViewController: UIViewController {
    
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeCreatedLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favCountLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        authorLabel.text = "@\(User.currentUser!.screenname!)"
//        userNameLabel.text = User.currentUser!.name!
//        profileImageView.setImageWithURL(NSURL(string: (User.currentUser?.profileImageUrl)!)!)
//        
//        tweetContent.text = tweet.user.text
//        authorLabel.text = "@\(tweet.user!.screenname!)"
//        
//        userNameLabel.text = tweet.user?.name!
//        timeCreatedLabel.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow)
//        profileImageView.setImageWithURL(NSURL(string: tweet.user!.profileImageUrl!)!)
//        
//        tweetID = tweet.id
//        retweetCountLabel.text = String(tweet.retweetTotal!)
//        favCountLabel.text = String(tweet.favTotal!)
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
