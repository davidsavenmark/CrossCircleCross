//
//  CrossCircleCrossDelegate.swift
//  CrossCircleCross
//
//  Created by David Sävenmark on 2021-01-05.
//  Copyright © 2021 David Sävenmark. All rights reserved.
//

import Foundation

protocol CrossCircleCrossDelegate {
    func pieceAt (col: Int, row: Int) -> Piece?
}
