//
//  BoardView.swift
//  CrossCircleCross
//
//  Created by David Sävenmark on 2020-12-26.
//  Copyright © 2020 David Sävenmark. All rights reserved.
//

import UIKit

class BoardView: UIView {

    
    override func draw(_ rect: CGRect) {
        
        
        drawBoard()
        drawPieces()
        
    
    }
    
    private func drawPieces(){
    
        
    }
    
    
    
    private func drawBoard() {
        
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: bounds.height/3))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height/3))
        
        path.move(to: CGPoint(x: 0, y: bounds.height * 2/3))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 2/3))
        
        path.move(to: CGPoint(x: bounds.width/3, y: 0))
        path.addLine(to: CGPoint(x: bounds.width/3, y: bounds.height))
        
        path.move(to: CGPoint(x: bounds.width * 2/3, y: 0))
        path.addLine(to: CGPoint(x: bounds.width * 2/3, y: bounds.height))
        
        
        path.lineWidth = 6
        #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1).setStroke()
        path.stroke()
        
    }
    
   
    
    
 

}
