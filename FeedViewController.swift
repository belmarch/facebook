//
//  FeedViewController.swift
//  facebook
//
//  Created by Ron Belmarch on 9/4/14.
//  Copyright (c) 2014 Belmerica. All rights reserved.
//

import UIKit

 //   class FeedViewController: UIViewController {
    class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

        
    var isPresenting: Bool = true
    
    
    var imageView = UIImageView()
    var fullImageView = UIImageView()
        
    @IBOutlet weak var wedding1ImageView: UIImageView!
        @IBOutlet weak var wedding2ImageView: UIImageView!
        @IBOutlet weak var wedding3ImageView: UIImageView!
        @IBOutlet weak var wedding4ImageView: UIImageView!
        @IBOutlet weak var wedding5ImageView: UIImageView!
        
        
        @IBOutlet weak var blueView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        scrollView.contentSize = CGSize(width: 320, height: 1025)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapPhoto1(sender: UITapGestureRecognizer) {
        
        imageView = wedding1ImageView
        
        performSegueWithIdentifier("photoSegue", sender: self)
        
    }

    @IBAction func onTapPhoto2(sender: UITapGestureRecognizer) {
        imageView = wedding2ImageView
          performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    @IBAction func onTapPhoto3(sender: UITapGestureRecognizer) {
        imageView = wedding3ImageView
          performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    @IBAction func onTapPhoto4(sender: UITapGestureRecognizer) {
        imageView = wedding4ImageView
          performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    @IBAction func onTapPhoto5(sender: UITapGestureRecognizer) {
        imageView = wedding5ImageView
          performSegueWithIdentifier("photoSegue", sender: self)
    }
 
/*
  override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as PhotoViewController
        
        destinationViewController.image = self.imageView.image
        
    }
   */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as PhotoViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        destinationVC.image = self.imageView.image
    }
    
        func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
            isPresenting = true
            return self
        }
        
        func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
            isPresenting = false
            return self
        }
        
        func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
            // The value here should be the duration of the animations scheduled in the animationTransition method
            return 0.4
        }
        
        
        func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
            println("animating transition")
            var containerView = transitionContext.containerView()
            var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
            var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
            
            if (isPresenting) {
                containerView.addSubview(toViewController.view)
                
                var window = UIApplication.sharedApplication().keyWindow
                var frame = window.convertRect(imageView.frame, fromView: containerView)
                
                
                var tempImageView = UIImageView(frame: imageView.frame)
                tempImageView.image = imageView.image
                tempImageView.frame.origin.y += 100
                
                window.addSubview(tempImageView)
                imageView.hidden=true
                
                
                toViewController.view.alpha = 0
                
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    toViewController.view.alpha = 1
                    tempImageView.frame = CGRect(x: 0, y: 60, width: self.imageView.image.size.width, height: self.imageView.image.size.height)
                    
                    }) { (finished: Bool) -> Void in
                        tempImageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                        self.imageView.hidden=false
                        transitionContext.completeTransition(true)
                }
                
            }
            else {
                
                var window = UIApplication.sharedApplication().keyWindow
                var frame = window.convertRect(imageView.frame, fromView: containerView)
                
                
                var tempImageView = UIImageView(frame:  CGRect(x: 0, y: 60, width: self.imageView.image.size.width, height: self.imageView.image.size.height))
                
                tempImageView.image = imageView.image
                
                
                window.addSubview(tempImageView)
                imageView.hidden=true
                
                toViewController.view.alpha = 1
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    fromViewController.view.alpha = 0
                    
                    tempImageView.frame = CGRect(x: self.imageView.frame.origin.x, y: self.imageView.frame.origin.y+110, width: self.imageView.frame.width, height: self.imageView.frame.height)
                    
                    
                    }) { (finished: Bool) -> Void in
                        
                        
                        tempImageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                        self.imageView.hidden=false
                        transitionContext.completeTransition(true)
                        fromViewController.view.removeFromSuperview()
                }
                
            }
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
