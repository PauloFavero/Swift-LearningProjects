//
//  ClockView.swift
//  WhereIsWallien
//
//  Created by Gustavo Lima on 28/04/2017.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit


/// Implementar uma view que indique a contagem de tempo para
/// encontrar o Wallien. 
/// Pode ser contagem progressiva ou regressiva a sua escolha
 @IBDesignable class ClockView: UIView {

 @IBInspectable var markColor: UIColor = .red
 @IBInspectable var backgroundClipColor: UIColor = .red
    public var time:Int = 0 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    
    override func draw(_ rect: CGRect) {
     
       
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setShouldAntialias(true)
        // Center point of the clock
        let centerPoint = CGPoint.init(x: self.frame.width/2, y: self.frame.height/2)
        
        drawClip(rect)
        drawClock(centerPoint)
        drawPointer(centerPoint, context)
        drawPassedTime(centerPoint)
        drawCenterPoint(centerPoint)
        drawClockMarks(centerPoint, context)
    
    }
    
    func drawClip(_ rect: CGRect){
        
        //Mark:CLIP
        //Set the clip area
        let pathClip = UIBezierPath(roundedRect:rect,cornerRadius:3)
        pathClip.addClip()
        backgroundClipColor.setFill()
        backgroundClipColor.setStroke()
        
        //set the width of clip
        pathClip.lineWidth = 3
        //draw the outline of clip with stroke UIColor
        pathClip.stroke()
        //paint the clip with the fill color
        pathClip.fill()
    }
    
    func drawClock(_ centerPoint: CGPoint){
        //MARK:Clock
        //create the circle
        let circle = UIBezierPath.init(arcCenter: centerPoint, radius: 40, startAngle: 0.0, endAngle: .pi*2, clockwise: true)
        //Circle colors
        UIColor.green.setFill()
        UIColor.white.setStroke()
        // Draw the clock
        circle.lineWidth = 3
        circle.fill()
        circle.stroke()
    }

    func drawPointer(_ centerPoint: CGPoint, _ context: CGContext){
        //MARK:Pointer
        let angleRotation:CGFloat = CGFloat.pi/30
        var secondsPointer = UIBezierPath()
        let secondsPointerColor = UIColor(colorLiteralRed: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        secondsPointerColor.setStroke()
        secondsPointer.move(to: centerPoint)
        let endPointerPoint = CGPoint(x: 35*cos(CGFloat(time) * angleRotation - .pi/2)+centerPoint.x, y:  35*sin(-CGFloat(time) *  angleRotation - .pi/2)+centerPoint.y)
        secondsPointer.addLine(to: endPointerPoint)
        secondsPointer.stroke()
        context.saveGState()
    }
    func drawPassedTime(_ centerPoint: CGPoint){
        //draws the red area
        let angleRotation:CGFloat = CGFloat.pi/30
        var closedPath = UIBezierPath()
        closedPath.addArc(withCenter: centerPoint, radius: 38, startAngle: -(.pi/2), endAngle: angleRotation*CGFloat(time)-(.pi/2), clockwise: true)
        closedPath.addLine(to: centerPoint)
        closedPath.close()
        UIColor.red.setFill()
        closedPath.fill()
    }
    
    func drawCenterPoint(_ centerPoint: CGPoint){
        //Draw the center point
        let centerCircle = UIBezierPath()
        centerCircle.addArc(withCenter: centerPoint, radius: 2, startAngle: 0.0, endAngle: .pi*2, clockwise: true)
        UIColor.black.setFill()
        centerCircle.fill()
    }
    func drawClockMarks(_ centerPoint: CGPoint, _ context: CGContext){
        //MARK:Clock marks
        let markWidth:CGFloat = 2
        let markSize:CGFloat = 3
        var markPath: UIBezierPath
        markColor.setFill()
        context.translateBy(x: centerPoint.x, y: 10)
        
        //Draws seconds markes
        var angle:CGFloat = 0
        for i in 0...11{
            context.saveGState()
            //rotate and translate
            context.translateBy(x: 40*sin(angle), y: 40-40*cos(angle))
            context.rotate(by: angle)
            markPath = UIBezierPath(rect: CGRect(x: -1, y: -1, width: markWidth, height: markSize))
            angle = angle + CGFloat(2 * CGFloat.pi/12)
            //6 - fill the marker rectangle
            markPath.fill()
            
            //7 - restore the centred context for the next rotate
            context.restoreGState()
        }
        context.setShouldAntialias(true)
    }
}
