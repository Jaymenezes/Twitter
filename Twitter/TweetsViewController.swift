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
            self.tweets = tweets
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
    
    func onRefresh() {
            self.refreshControl.endRefreshing()
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweets = self.tweets {
            return tweets.count;
        }
        return 0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCell", forIndexPath: indexPath) as! TweetsTableViewCell
        

        
        let imageUrl = tweets![indexPath.row].user?.profileImageUrl!
        cell.profileImageView.setImageWithURL(NSURL(string: imageUrl!)!)
        
        
        cell.tweetContent.text = tweets![indexPath.row].text!
        
        
        cell.userNameLabel.text = tweets![indexPath.row].user?.name!
        cell.timeCreatedLabel.text = tweets![indexPath.row].createdAtString!
        cell.authorLabel.text = "@" + tweets![indexPath.row].user!.screenname!
        
//        cell.userHandle.text = tweets![indexPath.row].user!.screenname!;


//
//
        
        return cell;
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
