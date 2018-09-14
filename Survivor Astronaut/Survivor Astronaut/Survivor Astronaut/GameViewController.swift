//
//  GameViewController.swift
//  Survivor Astronaut
//
//  Created by Paulo Henrique Favero Pereira on 5/29/17.
//  Copyright © 2017 Paulo Henrique Favero Pereira. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        
        if UserDefaults.standard.bool(forKey: "launchedBefore"){
            if let view = self.view as! SKView? {
                if UserDefaults.standard.integer(forKey: "record") == 0{
                    
                    UserDefaults.standard.set(0, forKey: "record")
                    
                }
                // Load the SKScene from 'GameScene.sks'
                
                let scene = SKScene(fileNamed: "GameScene")
                
                // Set the scale mode to scale to fit the window
                scene?.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                tapGesture.isEnabled = false
                
                
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
                
            }
        }
        else{
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            UserDefaults.standard.integer(forKey: "record")
            UserDefaults.standard.set(0, forKey: "record")
            
            // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
            // including entities and graphs.
            if let view = self.view as! SKView? {
                // Load the SKScene from 'Tutorial.sks'
                
                let scene = SKScene(fileNamed: "Tutorial")
                
                // Set the scale mode to scale to fit the window
                scene?.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                tapGesture.isEnabled = true
                
                
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
            }
            
        }
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
            let scene = SKScene(fileNamed: "GameScene")
            
            // Set the scale mode to scale to fit the window
            scene?.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(scene)
            tapGesture.isEnabled = false
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
        }
        
    }
   
        override var shouldAutorotate: Bool {
            return true
        }
        
        override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return .allButUpsideDown
            } else {
                return .all
            }
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Release any cached data, images, etc that aren't in use.
        }
        
        override var prefersStatusBarHidden: Bool {
            return true
        }
}
