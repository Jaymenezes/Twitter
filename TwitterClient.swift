//
//  TwitterClient.swift
//  Twitter
//
//  Created by user on 2/8/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit
import BDBOAuth1Manager


let twitterConsumerKey = "cYH6p8Uo2U6Sfjj2B6WThBFvD"
let twitterConsumerSecret = "UIwv3egePK7V75LI5w1an01OIL7EHrMgrYxzD5TReisBfo7JJ4"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")



class TwitterClient: BDBOAuth1SessionManager {
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
        
    }
    
    
    

}
