//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by giftbot on 2018. 6. 18..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit


final class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageView: UIImageView!
    
    
    var zoomScale: CGFloat = 1 {
        didSet{
            print("current Zoom Scale :", String(format: "%.2f", zoomScale))
        }
    }
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        updateScrollViewZoomScale()
    }
    
    func updateScrollViewZoomScale() {
        let widthScale = view.bounds.width / imageView.bounds.width
        let heightScale = view.bounds.height / imageView.bounds.height
        let mimScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = mimScale
        scrollView.zoomScale = 1
        scrollView.maximumZoomScale = 3
    }
    // MARK: Action Handler
    
    @IBAction private func fitToWidth(_ sender: Any) {
        zoomScale = scrollView.frame.width / imageView.image!.size.width
        scrollView.setZoomScale(zoomScale, animated: true)
        print("\n---------- [ fitToWidth ] ----------")
        
    }
    
    @IBAction private func scaleDouble(_ sender: Any) {
        scrollView.setZoomScale(zoomScale * 2, animated: true)
        zoomScale = scrollView.zoomScale
        print("\n---------- [ scaleDouble ] ----------")
    }
    
    
    @IBAction private func moveContentToRight(_ sender: Any) {
        
        let point = CGPoint(x: scrollView.contentOffset.x + 150, y: scrollView.contentOffset.y)
        scrollView.setContentOffset(point, animated: true)
        
        print("\n---------- [ moveContentToRight ] ----------")
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
