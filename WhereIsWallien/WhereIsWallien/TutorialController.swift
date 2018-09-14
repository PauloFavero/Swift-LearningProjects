//
//  TutorialController.swift
//  WhereIsWallien
//
//  Created by Paulo Henrique Favero Pereira on 5/16/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

class TutorialController: UIViewController, UIScrollViewDelegate{


    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipTutorial: UIButton!

    override func viewDidLoad() {        
        skipTutorial.isHidden = true
        
        
        let page1: UIView! = Bundle.main.loadNibNamed("page1Tutorial", owner: self, options: nil)![0] as! UIView
        let page2: UIView! = Bundle.main.loadNibNamed("page2Tutorial", owner: self, options: nil)![0] as! UIView
        let page3: UIView! = Bundle.main.loadNibNamed("page3Tutorial", owner: self, options: nil)![0] as! UIView
        let page4: UIView! = Bundle.main.loadNibNamed("page4Tutorial", owner: self, options: nil)![0] as! UIView
        let page5: UIView! = Bundle.main.loadNibNamed("page5Tutorial", owner: self, options: nil)![0] as! UIView
        let page6: UIView! = Bundle.main.loadNibNamed("page6Tutorial", owner: self, options: nil)![0] as! UIView
        let page7: UIView! = Bundle.main.loadNibNamed("page7Tutorial", owner: self, options: nil)![0] as! UIView
        
        let pages:[UIView?] = [page1,page2,page3,page4,page5,page6,page7]
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        
        for page in pages{
            
            page?.frame = (page?.frame.offsetBy(dx: scrollView.contentSize.width, dy: 0))!
            
            scrollView.addSubview(page!)
            
            scrollView.contentSize = CGSize(width: scrollView.contentSize.width + self.view.frame.width, height: (page?.frame.height)!)
            
            
            print(scrollView.contentSize)
            
        }
        
        scrollView.isPagingEnabled = true
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if pageControl.currentPage < 6 {
            skipTutorial.isHidden = true
        }else
        {
            skipTutorial.isHidden = false
        }
        let page = floor(scrollView.contentOffset.x / self.view.frame.width)
        
        pageControl.currentPage = Int(page)
        print(pageControl.currentPage)
        
        if pageControl.currentPage < 6 {
            skipTutorial.isHidden = true
        }else
        {
            skipTutorial.isHidden = false
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
