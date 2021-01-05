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
        print(crossCircleCross)
    }


}

extension CrossCircleCrossViewController: CrossCircleCrossDelegate {
    func pieceAt(col: Int, row: Int) -> Piece? {
        return crossCircleCross.pieceAt(col: col, row: row)
    }
    
    
}

