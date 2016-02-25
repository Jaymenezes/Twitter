//
//  ComposeViewController.swift
//  Twitter
//
//  Created by user on 2/23/16.
//  Copyright © 2016 Jean. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var composeButton: UINavigationItem!
    @IBOutlet weak var cancelComposeButton: UIBarButtonItem!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var composeTweetTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        User.currentUser?.profileImageUrl
        User.currentUser?.name
        User.currentUser?.screenname
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelComposeAction(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)

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
