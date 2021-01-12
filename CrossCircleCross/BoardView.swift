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
        
        
        //drawImageBoard()
        
        drawBoard()
        drawPieces()
        
    
    }
    
    private func drawPieces(){
        for row in 0..<3 {
            for col in 0..<3 {
                if let piece = crossCircleCrossDelegate?.pieceAt(col: col, row: row) {
                 
//                    drawPieceAt(col: col, row: row, isX: piece.player.isX())
                    drawImagePieceAt(col: col, row: row, isX: piece.player.isX())
                
                }
            }
        }
       
    }
    
    private func drawPieceAt(col: Int, row: Int, isX: Bool) {
        let center = centerOf(col: col, row: row)
        let path: UIBezierPath
        
        if isX {
            
            
            path = UIBezierPath()
            
            path.move(to: CGPoint(x: center.x - halfCellSide * ratio, y: center.y - halfCellSide * ratio))
            path.addLine (to: CGPoint(x: center.x + halfCellSide * ratio, y: center.y + halfCellSide * ratio))
            
            path.move(to: CGPoint(x: center.x + halfCellSide * ratio, y: center.y - halfCellSide * ratio))
            path.addLine (to: CGPoint(x: center.x - halfCellSide * ratio, y: center.y + halfCellSide * ratio))
            
            
            #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1).setStroke()
            path.lineWidth = 5
            path.stroke()
            
        }else {
            path = UIBezierPath(arcCenter: CGPoint(x: center.x, y: center.y), radius: halfCellSide * ratio, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
            
            
            
        }
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
    
    private func drawImageBoard() {
        
        let img = UIImage(named:"gameboard")
        img?.draw(in:CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
    }
   
    
    private func drawImagePieceAt(col: Int, row: Int, isX: Bool) {
        let img = UIImage(named: isX ? "piece_cross" : "piece_circle")
        let center = centerOf(col: col, row: row)
        let x = center.x - ratio * halfCellSide
        let y = center.y - ratio * halfCellSide
        img?.draw(in: CGRect(x: x, y: y, width: 2 * ratio * halfCellSide, height: 2 * ratio * halfCellSide))
        
        
    }
 

}
