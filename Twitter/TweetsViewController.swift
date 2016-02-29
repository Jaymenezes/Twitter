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
    
    
 
 
    
    @IBOutlet weak var composeNewTweet: UIBarButtonItem!
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "DetailsSegue") {
            let cell = sender as! UITableViewCell
            
            let indexPath = tableView.indexPathForCell(cell)
            let tweet = tweets?[indexPath!.row]
            
            let tweetDetaislViewController = segue.destinationViewController as! DetailsTweetViewController
            tweetDetaislViewController.tweet = tweet
        }
            
        else if (segue.identifier) == "ComposeSegue" {
        
            
            let user = User.currentUser
            
            let composeViewController = segue.destinationViewController as! ComposeViewController
            composeViewController.user = user
        
            
        }
        
        else if (segue.identifier) == "SegueToProfile" {
            
            let tweet = self.tweets
            let user = User.currentUser
            
            let profileViewController = segue.destinationViewController as! ProfileViewController
            profileViewController.user = user
            
            
        }

    }
    
    
    // MARK: - Navigation
    
}








