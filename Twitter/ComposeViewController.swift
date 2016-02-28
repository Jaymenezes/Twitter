//
//  ComposeViewController.swift
//  Twitter
//
//  Created by user on 2/23/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    var user: User?
    var tweet: Tweet?
    var author: String?
    var tweetContent: String = ""
    var isReply: Bool?

    @IBOutlet weak var composeButton: UINavigationItem!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var composeNewTweet: UITextView!
    @IBOutlet weak var characLimit: UILabel!
    @IBOutlet weak var createTweetButton: UIBarButtonItem!
    @IBOutlet weak var placeholderLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        composeNewTweet.delegate = self
        authorLabel.text = "@\(User.currentUser!.screenname!)"
        userNameLabel.text = User.currentUser!.name!
        profileImageView.setImageWithURL(NSURL(string: (User.currentUser?.profileImageUrl)!)!)
        
        placeholderLabel.text = "What's Happening?"
        composeNewTweet.addSubview(placeholderLabel)
        placeholderLabel.hidden = !composeNewTweet.text.isEmpty
        
        composeNewTweet.becomeFirstResponder()

        
        if (isReply) == true {
            composeNewTweet.text = "@\((tweet?.user?.screenname)!)"
            if  0 < (141 - composeNewTweet.text!.characters.count) {
                createTweetButton.enabled = true
                characLimit.text = "\(140 - composeNewTweet.text!.characters.count)"
            }
            else{
                createTweetButton.enabled = false
            }
            isReply = false
        }        }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    @IBAction func onCreateNewTweet(sender: AnyObject) {
        
        tweetContent = composeNewTweet.text
        
        let escapedTweetMessage = tweetContent.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        
        
        if isReply == true {
            TwitterClient.sharedInstance.reply(escapedTweetMessage!, statusID: Int(tweet!.id)!, params: nil, completion: { (error) -> () in
                print("replying")

            })
            
            isReply = false
            navigationController?.popViewControllerAnimated(true)
        } else {
            TwitterClient.sharedInstance.compose(escapedTweetMessage!, params: nil, completion: { (error) -> () in
                print("composing")
            })
            navigationController?.popViewControllerAnimated(true)
        }

        
    }
    
        
        
    
    


    func textViewDidChange(textView: UITextView) {
         placeholderLabel.hidden = !composeNewTweet.text.isEmpty
        if  0 < (141 - composeNewTweet.text!.characters.count) {
            createTweetButton.enabled = true
            characLimit.text = "\(140 - composeNewTweet.text!.characters.count)"
            
        }
        else{
            createTweetButton.enabled = false
            characLimit.text = "\(140 - composeNewTweet.text!.characters.count)"
           
            
        }
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    


}