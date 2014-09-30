//
//  InstagramViewController.swift
//  fb_album
//
//  Created by Engly Chang on 9/24/14.
//  Copyright (c) 2014 Engly Chang. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    //imagecontainer is the image storing the previously clicked img
    var imageContainer: UIImage!
    
    var contentOffset: CGFloat!
    var ratio: Float!
    var breakpoint: CGFloat!
    var originalFeedImgFrame: CGRect!
    var targetContentOffset: CGPoint!
    
    @IBOutlet weak var donBtnImg: UIImageView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var imgController: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.contentMode = .ScaleAspectFill
        
        imageView.image = imageContainer
        
        imageView.frame = CGRect (x: 0, y:  (568 - CGFloat(320/ratio))/2, width: 320, height: CGFloat(320/ratio))
        
        println("image view frame:\(imageView.frame)")
        
        
        scrollView.frame = CGRect (x: 0, y: 0, width: 320, height: 568)
        scrollView.contentSize = CGSize(width: 320, height: 569)
        
//        println("scrollview view: \(scrollView.frame)")
        
        scrollView.delegate = self
        
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 1)
    }
    
    @IBAction func onDoneBtn(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.imageView.frame = self.originalFeedImgFrame
            self.view.backgroundColor = UIColor(white: 0, alpha: 0)
            self.imgController.alpha = 0
            self.donBtnImg.alpha = 0
            
            }) { (finished:Bool) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)

        }
    }
    
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        println("begin scrolling")
        
        self.contentOffset = scrollView.contentOffset.y
        
        var ty = convertValue(Float(self.contentOffset), r1Min: 0, r1Max: 568/3, r2Min: 1, r2Max: 0)
        
        //negative y translation
        var Nty = convertValue(Float(self.contentOffset), r1Min: 0, r1Max: -568/3, r2Min:1, r2Max: 0)
        
        println("content offset:\(contentOffset)")
        
        if (contentOffset > 0){
            self.view.backgroundColor = UIColor(white: 0, alpha: CGFloat(ty))
        } else if (contentOffset < 0){
            self.view.backgroundColor = UIColor(white: 0, alpha: CGFloat(Nty))
        }
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        println("begin dragging")
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.imgController.alpha = 0
            self.donBtnImg.alpha = 0
        })
        
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
            // This method is called right as the user lifts their finger
            
            self.contentOffset = scrollView.contentOffset.y
            self.breakpoint = 60.0
            
            // if scrolled up pass 60px
            if (contentOffset > breakpoint){
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
        
                 
                    self.view.backgroundColor = UIColor(white: 0, alpha: 0)
                    self.imgController.alpha = 0
                    self.donBtnImg.alpha = 0
                    self.imageView.frame = self.originalFeedImgFrame
                    
                    }, completion: { (finished:Bool) -> Void in
                        self.dismissViewControllerAnimated(true, completion: nil)

                })
                
            } else if (contentOffset < breakpoint && contentOffset > -breakpoint ){
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.imgController.alpha = 1
                    self.donBtnImg.alpha = 1
                })
                
            } else if (-breakpoint > contentOffset) {
                
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.imageView.frame = self.originalFeedImgFrame
                    self.view.backgroundColor = UIColor(white: 0, alpha: 0)
                    self.imgController.alpha = 0
                    self.donBtnImg.alpha = 0

                    }, completion: { (finished:Bool) -> Void in
                        self.dismissViewControllerAnimated(true, completion: nil)
                })
            }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
        self.breakpoint = 60.0
        
        // if scrolled up pass 60px
        if (contentOffset > breakpoint){
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                
                self.imageView.frame = self.originalFeedImgFrame
                self.view.backgroundColor = UIColor(white: 0, alpha: 0)
                self.imgController.alpha = 0
                self.donBtnImg.alpha = 0

                }, completion: { (finished:Bool) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
            })
            
        } else if (contentOffset < breakpoint && contentOffset > -breakpoint ){
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                
                self.imgController.alpha = 1
                self.donBtnImg.alpha = 1
            })
            
        } else if (-breakpoint > contentOffset) {
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.imageView.frame = self.originalFeedImgFrame
                self.view.backgroundColor = UIColor(white: 0, alpha: 0)
                self.imgController.alpha = 0
                self.donBtnImg.alpha = 0
                
                }, completion: { (finished:Bool) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
            })
            
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
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
