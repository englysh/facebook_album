//
//  MainViewController.swift
//  fb_album
//
//  Created by Engly Chang on 9/24/14.
//  Copyright (c) 2014 Engly Chang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning, UIScrollViewDelegate  {
    
    var contentOffset: CGPoint!
    var oScrollP: CGPoint!
    var scrollTranslation: CGFloat!
    
    @IBOutlet weak var profileFeedView: UIImageView!
    @IBOutlet weak var profileScrollView: UIScrollView!
    
    @IBOutlet weak var insta1: UIImageView!
    @IBOutlet weak var insta2: UIImageView!
    @IBOutlet weak var wedding1: UIImageView!
    @IBOutlet weak var wedding2: UIImageView!
    @IBOutlet weak var wedding3: UIImageView!
    @IBOutlet weak var wedding4: UIImageView!
    @IBOutlet weak var wedding5: UIImageView!
    
    var originalW: Float!
    var originalH: Float!
    var imgRatio: Float!
    
    
    //var clickedOnImg: UIImageView!
    var clickedOnImg: UIImageView!
    var clickedImgString: String!
    var tempImage: UIImageView!
    
    var greyView: UIView!
    
    var isPresenting: Bool = true
    
    
    var window = UIApplication.sharedApplication().keyWindow
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        profileScrollView.delegate = self
        profileScrollView.frame = CGRect (x: 0, y: 64, width: 320, height: 568 - 64)
        profileScrollView.contentSize = profileFeedView.image!.size
        //profileScrollView.contentInset = UIEdgeInsets (top: 0, left: 0, bottom: 44, right: 0)
        
        // The onCustomTap
        var tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: "onCustomTap:")
        var tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: "onCustomTap:")
        var tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: "onCustomTap:")
        var tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: "onCustomTap:")
        var tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: "onCustomTap:")
        var tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: "onCustomTap:")
        var tapGestureRecognizer7 = UITapGestureRecognizer(target: self, action: "onCustomTap:")
        
        // Optionally set the number of required taps, e.g., 2 for a double click
        tapGestureRecognizer1.numberOfTapsRequired = 1;
        tapGestureRecognizer2.numberOfTapsRequired = 1;
        tapGestureRecognizer3.numberOfTapsRequired = 1;
        tapGestureRecognizer4.numberOfTapsRequired = 1;
        tapGestureRecognizer5.numberOfTapsRequired = 1;
        tapGestureRecognizer6.numberOfTapsRequired = 1;
        tapGestureRecognizer7.numberOfTapsRequired = 1;
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        insta1.addGestureRecognizer(tapGestureRecognizer1)
        insta2.addGestureRecognizer(tapGestureRecognizer2)
        wedding1.addGestureRecognizer(tapGestureRecognizer3)
        wedding2.addGestureRecognizer(tapGestureRecognizer4)
        wedding3.addGestureRecognizer(tapGestureRecognizer5)
        wedding4.addGestureRecognizer(tapGestureRecognizer6)
        wedding5.addGestureRecognizer(tapGestureRecognizer7)

        
    }
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        println("begin dragging")
        self.contentOffset = profileScrollView.contentOffset
        oScrollP = contentOffset
        //println(self.oScrollP)
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        self.contentOffset = profileScrollView.contentOffset
        println("begin scrolling")
        
        self.scrollTranslation = self.contentOffset.y - self.oScrollP.y
        
        
        //println(scrollTranslation)
        //println(self.contentOffset)
        //println(self.oScrollP)
    }
    
    
    func onCustomTap (tapGestureRecognizer: UITapGestureRecognizer) {
        var point = tapGestureRecognizer.locationInView(view)
        // User tapped at the point above. Do something with that if you want.
        //println(tapGestureRecognizer)
        
        if (tapGestureRecognizer.view == self.insta1){
            println("insta1")
            self.clickedOnImg = self.insta1
            self.clickedImgString = "instagram1"
            self.originalH = 640.0
            self.originalW = 640.0
            
        } else if (tapGestureRecognizer.view == self.insta2){
            println("insta2")
            self.clickedOnImg = self.insta2
            self.clickedImgString = "instagram2"
            println(clickedOnImg.frame)
           
            self.originalH = 640.0
            self.originalW = 640.0
            
        } else if (tapGestureRecognizer.view == self.wedding1){
            println("wedding1")
            self.clickedOnImg = self.wedding1
            self.clickedImgString = "wedding1"
            
            self.originalH = 675.0
            self.originalW = 900.0
            
        } else if (tapGestureRecognizer.view == self.wedding2){
            println("wedding2")
            self.clickedOnImg = self.wedding2
            self.clickedImgString = "wedding2"
            
            self.originalH = 675.0
            self.originalW = 900.0
            
        } else if (tapGestureRecognizer.view == self.wedding3){
            println("wedding3")
            self.clickedOnImg = self.wedding3
            self.clickedImgString = "wedding3"
            
            self.originalW = 960.0
            self.originalH = 640.0
            
        } else if (tapGestureRecognizer.view == self.wedding4){
            println("wedding4")
            self.clickedOnImg = self.wedding4
            self.clickedImgString = "wedding4"
            
            self.originalW = 960.0
            self.originalH = 640.0
            
        } else if (tapGestureRecognizer.view == self.wedding5){
            println("wedding5")
            self.clickedOnImg = self.wedding5
            self.clickedImgString = "wedding5"
            
            self.originalW = 960.0
            self.originalH = 640.0
        }



        //self.performSegueWithIdentifier("viewPhotoSeq", sender: self)
        var window = UIApplication.sharedApplication().keyWindow
        
        //creating a temp img to duplicate the original img
        tempImage = UIImageView(frame: self.clickedOnImg.frame)
        tempImage.image = UIImage (named: self.clickedImgString)
        
        //dumping the temp image into the subview
        window.addSubview(tempImage)

        //getting the postion of the imgs desired absolute position
        var frame = window.convertRect(self.clickedOnImg.frame, fromView: self.profileScrollView)
        
        tempImage.frame = frame
        //var ratio = tempImage.frame.size.width / tempImage.frame.size.height

        self.imgRatio = originalW/originalH
        var newH = CGFloat(320/self.imgRatio)
        var newW = 320
        var newY = CGFloat((568-newH)/2)
        
        self.tempImage.contentMode = .ScaleAspectFill

        self.performSegueWithIdentifier("viewPhotoSeq", sender: self)

        UIView.animateWithDuration(0.3, animations:
            
            { () -> Void in
                self.tempImage.frame = CGRect (x: 0, y: newY, width:320, height: newH)
                self.clickedOnImg.alpha = 0

            })
            { (finished:Bool) -> Void in
                self.tempImage.alpha = 0
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var destinationVC = segue.destinationViewController as InstagramViewController
        
        
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
        println(self.clickedOnImg)
        
        //putting the clicked img from this view controller to the next
        destinationVC.imageContainer = self.tempImage.image
        destinationVC.ratio = self.imgRatio
        
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
        return 0.3
    }
    
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                fromViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()

                    self.tempImage.alpha = 1
                    self.clickedOnImg.alpha = 1

                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    var frame = self.view.convertRect(self.clickedOnImg.frame, fromView: self.profileScrollView)
                    
                        self.tempImage.frame = frame

                        }, completion: { (finished:Bool) -> Void in
                            self.tempImage.removeFromSuperview()


                            
                    })
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
