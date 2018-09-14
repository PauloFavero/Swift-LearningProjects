//
//  GameScene.swift
//  Survivor Astronaut
//
//  Created by Paulo Henrique Favero Pereira on 5/29/17.
//  Copyright © 2017 Paulo Henrique Favero Pereira. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

struct PhysicsCategory {
    static let none: UInt32      = 0     // 0
    static let astronaut: UInt32 = 0b1   // 1
    static let enemy: UInt32     = 0b10  // 2
    static let planet: UInt32    = 0b100 // 4
}

class GameScene: SKScene, SKPhysicsContactDelegate, AsteroidBeltDelegate  {
    
    var bgVideoPlayer: AVPlayer!
    public var score: Int = 0
    var lives: Int = 0
    var scoreLabel:SKLabelNode!
    var recordLabel:SKLabelNode!
    var livesLabel:SKLabelNode!
    var planetNode:SKNode!
    var astronautNode:SKNode!
    var astronautAngle:CGFloat = 0
    var astronautOrbitRadius:CGFloat = 0
    var astronautSpeed:CGPoint = CGPoint.zero
    var enemies = [AsteroidsBeltNode]()
    var damageAction:SKAction!
    var scoreAction:SKAction!
    
    var gameoverLabel:SKLabelNode!
    
    var bgMusicPlayer: AVAudioPlayer!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let filePath = Bundle.main.path(forResource: "background", ofType: "mp4")!
        
        let url = URL(fileURLWithPath: filePath)
        
        self.bgVideoPlayer = AVPlayer(url: url)
        self.bgVideoPlayer.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(GameScene.bgVideoDidEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: self.bgVideoPlayer.currentItem)
        
        
        //VIDEO BACKGROUND
        let videoNode = SKVideoNode(avPlayer: self.bgVideoPlayer)
        
        videoNode.size = self.size
        videoNode.zPosition = -1
        videoNode.alpha = 0.4
        
        self.addChild(videoNode)
        
        videoNode.play()
        
        self.scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        self.recordLabel = self.childNode(withName: "recordLabel") as! SKLabelNode
        self.livesLabel = self.childNode(withName: "livesLabel") as! SKLabelNode
        
        self.planetNode = self.childNode(withName: "planet")!
        self.astronautNode = self.planetNode.childNode(withName: "astronaut")!
        
        if let planetBody = self.planetNode.physicsBody
        {
            planetBody.categoryBitMask = PhysicsCategory.planet
            planetBody.contactTestBitMask = PhysicsCategory.enemy
            planetBody.collisionBitMask = PhysicsCategory.none
        }
        
        if let astronautBody = self.astronautNode.physicsBody
        {
            astronautBody.categoryBitMask = PhysicsCategory.astronaut
            astronautBody.contactTestBitMask = PhysicsCategory.enemy
            astronautBody.collisionBitMask = PhysicsCategory.none
        }
        
        self.physicsWorld.contactDelegate = self
        
        self.damageAction = SKAction.sequence([
            SKAction.playSoundFileNamed("hit.wav", waitForCompletion: false),
            SKAction.colorize(with: SKColor.red, colorBlendFactor: 1.0, duration: 0.0),
            SKAction.colorize(withColorBlendFactor: 0.0, duration: 1.0)
            ])
        self.scoreAction = SKAction.group([
            SKAction.playSoundFileNamed("score.wav", waitForCompletion: false),
            
            SKAction.sequence([
                SKAction.scale(to: 2.0, duration: 0.2),
                SKAction.scale(to: 1.0, duration: 0.2)
                ]),
            
            SKAction.sequence([
                SKAction.run
                    {
                        self.scoreLabel.color = SKColor.orange
                        self.scoreLabel.colorBlendFactor = 1.0
                },
                SKAction.wait(forDuration: 0.2),
                SKAction.run
                    {
                        self.scoreLabel.colorBlendFactor = 0
                }
                ]),
            ])
        
        self.gameoverLabel = self.childNode(withName: "gameoverLabel") as! SKLabelNode
        self.gameoverLabel.isHidden = true
        
        self.setup()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(GameScene.addEnemy(timer:)), userInfo: nil, repeats: true)
        

    }
    
    func addEnemy(timer: Timer)
    {
        let enemy = AsteroidsBeltNode(radius: self.size.width, holeAngle: (.pi / 2))
        enemy.physicsBody = SKPhysicsBody(edgeChainFrom: enemy.path!)
        enemy.physicsBody?.categoryBitMask = PhysicsCategory.enemy
        enemy.physicsBody?.contactTestBitMask = PhysicsCategory.astronaut | PhysicsCategory.planet
        enemy.physicsBody?.collisionBitMask = PhysicsCategory.none
        
        enemy.gameDelegate = self
        
        
        self.enemies.append(enemy)
        
        self.addChild(enemy)
    }
    
    
    func bgVideoDidEnd(notification: NSNotification) {
        
        let playerItem = notification.object as! AVPlayerItem
        
        playerItem.seek(to: kCMTimeZero)
    }
    
    func setup()
    {
        self.anchorPoint = CGPoint(x:0.5, y:0.5)
        self.score = 0
        self.scoreLabel.text = String(self.score)
        self.recordLabel.text = String(UserDefaults.standard.integer(forKey: "record"))
        self.lives = 5
        self.livesLabel.text = String(self.lives)
        
        self.astronautAngle = 0;
        
        self.astronautOrbitRadius = self.planetNode.frame.size.width/2 + self.astronautNode.frame.size.width/2 + 50
        
         self.playBackgroundMusic()
    }
    
    func damageAstronaut()
    {
        self.lives -= 1
        self.livesLabel.text = String(self.lives)
        
        if self.lives == 0
        {
            // Game Over
            
            self.gameoverLabel.isHidden = false
            self.scene?.view?.isPaused = true
             //Ativar o tap gesture
            
            // Tap to replay
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GameScene.handleTapGesture(tapGestureRecognizer:)))
            
            self.scene?.view?.addGestureRecognizer(tapGesture)
    
            
            self.bgMusicPlayer.pause()
            
        } else {
            // Animate damage
            
            self.astronautNode.run(self.damageAction)
            
        }
        
    }
    
    //MARK: Gestures
    func handleTapGesture(tapGestureRecognizer:UITapGestureRecognizer)
    {
        // Restart de Game
        self.scene?.view?.removeGestureRecognizer(tapGestureRecognizer)
        
        self.scene?.view?.isPaused = false
        self.gameoverLabel.isHidden = true
        
        self.enemies.forEach { (enemy) in
            enemy.removeFromParent()
        }
        
        self.enemies.removeAll()
        
        self.setup()
    }
    
    func handlePanGesture(panGestureRecognizer:UIPanGestureRecognizer)
    {
        self.astronautSpeed = panGestureRecognizer.velocity(in: self.view)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        self.enemies.forEach { (enemy) in
            enemy.update()
        }
        
        self.astronautSpeed = CGPoint(x: self.astronautSpeed.x / 1.1,
                                      y: self.astronautSpeed.y)
        
        self.astronautAngle += self.astronautSpeed.x / 2000
        
        let astronautX = self.astronautOrbitRadius * cos(self.astronautAngle)
        let astronautY = self.astronautOrbitRadius * sin(self.astronautAngle)
        
        self.astronautNode.position = CGPoint(x:astronautX,
                                              y:astronautY)
        
    }
    
    func addScore()
    {
        self.score += 1
        if self.score > UserDefaults.standard.integer(forKey: "record"){
            UserDefaults.standard.set(self.score, forKey: "record")
            self.recordLabel.text = String(self.score)
        }
        self.scoreLabel.text = String(self.score)
    self.scoreLabel.run(self.scoreAction)}
    
    override func didMove(to view: SKView) {
        
        let panGesture = UIPanGestureRecognizer(target: self,
                    action: #selector(GameScene.handlePanGesture(panGestureRecognizer:)))
        
        view.addGestureRecognizer(panGesture)
        
    }
    
    func changeDifficulty(_ score:Int)->CGFloat{
        
        var angle:CGFloat
        
        angle = CGFloat(score)
        
        return angle
    }

    
    func playBackgroundMusic()
    {
        if self.bgMusicPlayer == nil {
            
            let musicPath = Bundle.main.path(forResource: "backgroundmusic", ofType: "mp4")
            let musicUrl = URL(fileURLWithPath: musicPath!)
            
            self.bgMusicPlayer = try! AVAudioPlayer(contentsOf: musicUrl)
            
            self.bgMusicPlayer.numberOfLoops = -1 // tocar para sempre
            
            self.bgMusicPlayer.prepareToPlay()
        }
        
        self.bgMusicPlayer.pause()
        self.bgMusicPlayer.currentTime = 0
        self.bgMusicPlayer.play()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let enemy:AsteroidsBeltNode?
        
        if contact.bodyA.categoryBitMask == PhysicsCategory.enemy
        {
            enemy = contact.bodyA.node as? AsteroidsBeltNode
            
        } else {
            
            enemy = contact.bodyB.node as? AsteroidsBeltNode
        }
        
        if enemy?.parent != nil
        {
            if collision == PhysicsCategory.astronaut | PhysicsCategory.enemy
            {
                // Inimigo atingiu o astronaulta
                self.damageAstronaut()
                
            } else if collision == PhysicsCategory.planet | PhysicsCategory.enemy
            {
                // Inimigo atingiu o planeta
                self.addScore()
            }
            
            // remove o inimigo se sempre que entrarem em contato com qualquer coisa
            if let index = self.enemies.index(of: enemy!) {
                
                self.enemies.remove(at: index)
            }
            
            enemy?.removeFromParent()
        }
    }

    

}
