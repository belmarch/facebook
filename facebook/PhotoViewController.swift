//
//  PhotoViewController.swift
//  facebook
//
//  Created by Ron Belmarch on 9/27/14.
//  Copyright (c) 2014 Belmerica. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    var image: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var actionsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 500)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        
    view.alpha = abs(50/self.scrollView.contentOffset.y)
        doneButton.alpha = abs(50/self.scrollView.contentOffset.y)
        actionsImage.alpha = abs(50/self.scrollView.contentOffset.y)
        println("offset \(self.scrollView.contentOffset.y)")
    
    
        
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
            if abs(scrollView.contentOffset.y) >= 100 {
            view.alpha=0
            dismissViewControllerAnimated(true, completion: nil)
            }
            // This method is called right as the user lifts their finger
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
