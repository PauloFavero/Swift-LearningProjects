//
//  AsteroidsBeltNode.swift
//  Survivor Astronaut
//
//  Created by Paulo Henrique Favero Pereira on 5/29/17.
//  Copyright © 2017 Paulo Henrique Favero Pereira. All rights reserved.
//

import SpriteKit


protocol AsteroidBeltDelegate {
    
    var score:Int {get}
    
}


class AsteroidsBeltNode: SKShapeNode {
    
    var rotation:CGAffineTransform
    var holeAngle:CGFloat
    var currentRadius:CGFloat
    
    var gameDelegate:AsteroidBeltDelegate?
    
    init(radius:CGFloat, holeAngle:CGFloat){
        
        self.currentRadius = radius
        self.holeAngle = holeAngle
        self.rotation = CGAffineTransform(rotationAngle: CGFloat(arc4random()))
        
        super.init()
        
        let path = UIBezierPath(arcCenter: CGPoint.zero, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        path.apply(self.rotation)
        
        self.path = path.cgPath
        
        self.fillColor = SKColor.clear
        self.strokeColor = SKColor(red: 143/255, green: 1, blue: 1, alpha: 1)
        
        let shader = SKShader(fileNamed: "enemyShader.fsh")
        self.strokeShader = shader
        
        self.isAntialiased = false
        self.lineWidth = 10
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(){
        
        //TODO: Add difficulty
        self.currentRadius *= 0.99

        let newPath = UIBezierPath(arcCenter: CGPoint.zero, radius: self.currentRadius, startAngle: 0, endAngle: 2 * .pi - self.holeAngle/2, clockwise: true)
        
        newPath.apply(self.rotation)
        
        self.path = newPath.cgPath
        
        // Cria um novo corpo de física mantendo os valores do antigo
        // mas usando o novo CGPath
        if let physicsBody = self.physicsBody
        {
            let categoryBitMask = physicsBody.categoryBitMask
            let contactTestBitMask = physicsBody.contactTestBitMask
            
            self.physicsBody = SKPhysicsBody(edgeChainFrom: newPath.cgPath)
            self.physicsBody?.categoryBitMask = categoryBitMask
            self.physicsBody?.contactTestBitMask = contactTestBitMask
            self.physicsBody?.collisionBitMask = 0
        }
        
        
        
    }

}
