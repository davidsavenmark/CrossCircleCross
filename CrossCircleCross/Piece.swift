//
//  Piece.swift
//  CrossCircleCross
//
//  Created by David Sävenmark on 2020-12-26.
//  Copyright © 2020 David Sävenmark. All rights reserved.
//

import Foundation

struct Piece: Hashable {
    let col: Int
    let row: Int
    let player: Player
}
