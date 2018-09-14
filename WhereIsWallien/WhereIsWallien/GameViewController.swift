//
//  GameViewController.swift
//  WhereIsWallien
//
//  Created by Gustavo Lima on 27/04/2017.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var clock: ClockView!
    @IBOutlet weak var scrollMap: UIScrollView!
    var timer:Timer?
    var queue:DispatchQueue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollMap.contentSize = contentView.frame.size
        clock.time = 0
            setTime()
    }
    
    func setTime() {
        
        queue = DispatchQueue(label: "Timer", qos: .background, attributes: .concurrent)
        
        queue?.async {
        
            self.timer = Timer(timeInterval: 1, target: self, selector: #selector(self.drawClock), userInfo: self , repeats: true)
            RunLoop.current.add(self.timer!, forMode: .commonModes)
            RunLoop.current.run()
            
        }
    }
    
func drawClock(){
    
    
    
    clock.time += 1
    
    if clock.time == 60{
        
        clock.time = 0
        self.timer?.invalidate()
        performSegue(withIdentifier: "gameOver", sender: self)
        
    }
    
}
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        // retorna a view que receberá o zoom
        return contentView
    }
}
