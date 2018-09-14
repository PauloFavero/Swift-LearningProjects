//
//  TutorialViewController.swift
//  Survivor Astronaut
//
//  Created by Paulo Henrique Favero Pereira on 5/31/17.
//  Copyright © 2017 Paulo Henrique Favero Pereira. All rights reserved.
//

import UIKit
import SpriteKit

class TutorialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        
        if UserDefaults.standard.bool(forKey: "launchedBefore"){
            if let view = self.view as! SKView? {
                // Load the SKScene from 'GameScene.sks'
                
                let scene = SKScene(fileNamed: "GameScene")
                
                // Set the scale mode to scale to fit the window
                scene?.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
                
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
                
            }
        }
        else{
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
            // including entities and graphs.
            if let view = self.view as! SKView? {
                // Load the SKScene from 'GameScene.sks'
                
                let scene = SKScene(fileNamed: "Tutorial")
                
                // Set the scale mode to scale to fit the window
                scene?.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
                
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
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
