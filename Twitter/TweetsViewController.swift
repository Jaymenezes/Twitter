//
//  TweetsViewController.swift
//  Twitter
//
//  Created by user on 2/13/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit
import AFNetworking


class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var tweets: [Tweet]?
    var refreshControl: UIRefreshControl!
    let delay = 2.0 * Double(NSEC_PER_SEC)
    
    
    var favButton: UIButton!
    var toggleFav = 2
    var toggleRetweet = 2
    
    

 
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
   
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
        
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        

        // Do any additional setup after loading the view.
        
        TwitterClient.sharedInstance.homeTImelineWithParams(nil) { (tweets, error) -> () in
            if (tweets != nil) {
                self.tweets = tweets
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
            
           
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
    
    
    
    //        trying to implement button animation

//    @IBAction func onTapRetweet(sender: UIButton) {
//        if toggleRetweet == 1 {
//            print("test on")
//            toggleRetweet = 2
//            sender.setImage(UIImage(named: "retweet-action-inactive"), forState: UIControlState.Normal)
//        }else{
//            toggleRetweet = 1
//            sender.setImage(UIImage(named: "retweet-action-on-green"), forState: UIControlState.Normal)
//            print("else works?")
//        }
//    }
//    
//    @IBAction func onTapFav(sender: UIButton) {
////        if toggleFav == 1 {
////            print("tweet pressed")
////            toggleFav = 2
////        sender.setImage(UIImage(named: "like-action-off"), forState: UIControlState.Normal)
////        }else{
////            toggleFav = 1
////            sender.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Normal)
////            print("twitter not pressed")
////            
////        }
//
//        sender.setImage(UIImage(named: "like-action-off"), forState: UIControlState.Normal)
//        sender.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Selected)
//        sender.setImage(UIImage(named: "like-action-on-pressed-red"), forState: UIControlState.Highlighted)
////
//        print("change state of button")
//    }
    
    
    
  

    
    
    func delay(delay:Double, closure:() -> ()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func onRefresh() {
        delay(1, closure: {
            self.refreshControl.endRefreshing()
        })
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCell", forIndexPath: indexPath) as! TweetsTableViewCell
        
        
        
        cell.selectionStyle = .None
        cell.tweet = tweets![indexPath.row]

        
        

               
        return cell;
    }
    
    
//    Wayman's method
//    func retweetClicked(tweetCell: TweetsTableViewCell) {
//        
//        let tweet = tweetCell.tweet! as Tweet
//        
//        // Check if tweet has already been retweeted
//        // By way of cool ternary operator:
//        tweet.beenRetweeted! ? (
//            // It's been retweeted already... let's unretweet it:
//            TwitterClient.sharedInstance.unRetweet(Int(tweetCell.tweetID)!, params: nil, completion: {(error) -> () in
//                tweetCell.retweetButton.setImage(UIImage(named: "retweet-action.png"), forState: UIControlState.Selected)
//                
//                if tweet.retweetTotal! > 1 {
//                    tweetCell.retweetCountLabel.text = String(tweet.retweetTotal! - 1)
//                } else {
//                    tweetCell.retweetCountLabel.hidden = true
//                    tweetCell.retweetCountLabel.text = String(tweet.retweetTotal! - 1)
//                }
//                
//                // locally update tweet dictionary so we don't need to make network request in order to update that cell
//                tweet.retweetTotal! -= 1
//                tweet.beenRetweeted! = false
//            }) // END CLOSURE
//            ) : (
//                // YES! HASN'T BEEN RETWEETED, SO LET'S DO THAT:
//                TwitterClient.sharedInstance.reTweet(Int(tweetCell.tweetID)!, params: nil, completion: {(error) -> () in
//                    tweetCell.retweetButton.setImage(UIImage(named: "retweet-action-on-pressed.png"), forState: UIControlState.Selected)
//                    
//                    if tweet.retweetTotal! > 0 {
//                        tweetCell.retweetCountLabel.text = String(tweet.retweetTotal! + 1)
//                    } else {
//                        tweetCell.retweetCountLabel.hidden = false
//                        tweetCell.retweetCountLabel.text = String(tweet.retweetTotal! + 1)
//                    }
//                    
//                    // locally update tweet dictionary so we don't need to make network request in order to update that cell
//                    tweet.retweetTotal! += 1
//                    tweet.beenRetweeted! = true
//                }) // END CLOSURE
//        ) // END TERNARY OPERATOR
//    }
    
    
    

    /*
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
