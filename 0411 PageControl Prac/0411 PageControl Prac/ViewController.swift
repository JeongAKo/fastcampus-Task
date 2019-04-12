//
//  ViewController.swift
//  0411 PageControl Prac
//
//  Created by Daisy on 11/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    scrollView.delegate = self
        
    scrollView.isPagingEnabled = true
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.showsHorizontalScrollIndicator = false
    
//    pagrControl.currentPage
//    pagrControl.numberOfPages = 4
        
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNum = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNum)
    }
}


