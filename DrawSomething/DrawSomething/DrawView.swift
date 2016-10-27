//
//  DrawView.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 27/10/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class DrawView: UIView {
    //MARK: - Properties -
    var beziers : [ColorBezierPath] = [] //= UIBezierPath()
    var color : UIColor = .black
    var strokeSize : CGFloat = 1
    //MARK: - Public Methods -
    
    func clear(){
        beziers = []
        //bezier = UIBezierPath()
        //re-draw
        setNeedsDisplay()
    }
    
    //MARK: - Init Methods -
    private func initialize(){
        backgroundColor = /*UIColor*/.white
        isMultipleTouchEnabled = false
    }
    
    //storyboard
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    //code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    //MARK: - Private Helpers -
    
    private func addLine(to point : CGPoint){
        //bezier.addLine(to: point)
        
        guard let b = beziers.last else {
            return
        }
        
        b.addLine(to: point)
        
        //re-draw
        setNeedsDisplay()

    }
    
    private func move(to point : CGPoint){
        let b = ColorBezierPath(strokeColor: color)
        b.lineWidth = strokeSize
        //b.strokeColor = color
        b.move(to: point)
        
        beziers.append(b)
        //bezier.move(to: point)
    }
    
    //MARK: - Override Methods -
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{
            return
        }
        
        let point = touch.location(in: self)
        move(to: point)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{
            return
        }
        
        let point = touch.location(in: self)
        addLine(to: point)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{
            return
        }
        
        let point = touch.location(in: self)
        addLine(to: point)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{
            return
        }
        
        let point = touch.location(in: self)
        addLine(to: point)
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        //color.setStroke()
        //bezier.stroke()
        
        for b in beziers{
            //b.strokeColor.setStroke()
            b.stroke()
        }
    }
    

}











