//
//  DetailViewController.swift
//  facebook
//
//  Created by Ron Belmarch on 9/6/14.
//  Copyright (c) 2014 Belmerica. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var commentContainer: UIView!
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController.popViewControllerAnimated(true)

    }
    
    override func viewDidLoad() {
        scrollView.contentSize = CGSize(width: 320, height: 1203)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLikeButton(sender: AnyObject) {
        likeButton.selected = !likeButton.selected
    }

    @IBAction func onCommentButton(sender: AnyObject) {
        commentField.becomeFirstResponder()
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
