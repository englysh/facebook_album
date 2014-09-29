//
//  TestViewController.swift
//  fb_album
//
//  Created by Engly Chang on 9/24/14.
//  Copyright (c) 2014 Engly Chang. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UIScrollViewDelegate  {
    
    @IBOutlet weak var wedding: UIImageView!
    @IBOutlet weak var theScrollView: UIScrollView!
    var contentOffSet: CGPoint!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        theScrollView.delegate = self
        theScrollView.contentSize = wedding.frame.size
        
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        // This method is called as the user scrolls
        self.contentOffSet = theScrollView.contentOffset

    println(contentOffSet)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
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
