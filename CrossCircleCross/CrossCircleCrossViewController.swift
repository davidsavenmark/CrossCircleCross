//
//  ViewController.swift
//  CrossCircleCross
//
//  Created by David Sävenmark on 2020-12-26.
//  Copyright © 2020 David Sävenmark. All rights reserved.
//

import UIKit

class CrossCircleCrossViewController: UIViewController {
    
    var crossCircleCross = CrossCircleCross()

    @IBOutlet weak var boardView: BoardView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.crossCircleCrossDelegate = self
    
        
    }
    
    @IBAction func dropAt(_ sender: UITapGestureRecognizer) {
        let finger = sender.location(in: boardView)
        let col: Int = Int(finger.x / (boardView.bounds.width/3))
        let row: Int = 2 - Int(finger.y / (boardView.bounds.height/3))
        crossCircleCross.dropAt(col: col, row: row)
        print(crossCircleCross)
        boardView.setNeedsDisplay()
        
        
    }
    
}
    
extension CrossCircleCrossViewController: CrossCircleCrossDelegate {
    func pieceAt(col: Int, row: Int) -> Piece? {
        return crossCircleCross.pieceAt(col: col, row: row)
    }
}

