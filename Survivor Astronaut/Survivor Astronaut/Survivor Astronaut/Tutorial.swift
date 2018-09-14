//
//  Tutorial.swift
//  Survivor Astronaut
//
//  Created by Paulo Henrique Favero Pereira on 5/30/17.
//  Copyright © 2017 Paulo Henrique Favero Pereira. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

class Tutorial: SKScene {
    
    var bgVideoPlayerTutorial: AVPlayer!
    //var panGestureImageNode:SKNode
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let filePath = Bundle.main.path(forResource: "background", ofType: "mp4")!
        
        let url = URL(fileURLWithPath: filePath)
        
        self.bgVideoPlayerTutorial = AVPlayer(url: url)
        self.bgVideoPlayerTutorial.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameScene.bgVideoDidEnd(notification:)),name: .AVPlayerItemDidPlayToEndTime, object: self.bgVideoPlayerTutorial.currentItem)
        
        
        //VIDEO BACKGROUND
        let videoNode = SKVideoNode(avPlayer: self.bgVideoPlayerTutorial)
        
        videoNode.size = self.size
        videoNode.zPosition = -1
        videoNode.alpha = 0.4
        
        self.addChild(videoNode)
        
        videoNode.play()
    }
    
    func bgVideoDidEnd(notification: NSNotification) {
        
        let playerItem = notification.object as! AVPlayerItem
        
        playerItem.seek(to: kCMTimeZero)
    }
    
    

}
