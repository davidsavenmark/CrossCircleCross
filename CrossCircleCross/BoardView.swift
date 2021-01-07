//
//  BoardView.swift
//  CrossCircleCross
//
//  Created by David Sävenmark on 2020-12-26.
//  Copyright © 2020 David Sävenmark. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    var crossCircleCrossDelegate: CrossCircleCrossDelegate?
    
    private var halfCellSide: CGFloat = -1
    private var ratio: CGFloat = 0.7 // 70 %

    
    override func draw(_ rect: CGRect) {
        halfCellSide = bounds.width / 6
        
        
        drawBoard()
        drawPieces()
        
    
    }
    
    private func drawPieces(){
        for row in 0..<3 {
            for col in 0..<3 {
                if let piece = crossCircleCrossDelegate?.pieceAt(col: col, row: row){
                    if piece.player.isX() {
                        drawX(col: col, row: row)
                    }else {
                        drawO(col: col, row: row)
                    }
                }
            }
        }
       
       
        
    }
    
    private func drawX(col: Int, row: Int) {

        let center = centerOf(col: col, row: row)
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: center.x - halfCellSide * ratio, y: center.y - halfCellSide * ratio))
        path.addLine (to: CGPoint(x: center.x + halfCellSide * ratio, y: center.y + halfCellSide * ratio))
        
        path.move(to: CGPoint(x: center.x + halfCellSide * ratio, y: center.y - halfCellSide * ratio))
        path.addLine (to: CGPoint(x: center.x - halfCellSide * ratio, y: center.y + halfCellSide * ratio))
        
        
        #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1).setStroke()
        path.lineWidth = 5
        path.stroke()
        
        
        
        
    }
    
    private func drawO(col: Int, row: Int) {
        let center = centerOf(col: col, row: row)
        let path = UIBezierPath(arcCenter: CGPoint(x: center.x, y: center.y), radius: halfCellSide * ratio, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1).setStroke()
        path.lineWidth = 5
        path.stroke()
        
        
    }
    
    private func centerOf(col: Int, row: Int) -> CGPoint{
        return CGPoint(x: halfCellSide + CGFloat(col) * 2 * halfCellSide, y: halfCellSide + CGFloat(2 - row) * 2 * halfCellSide )
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
