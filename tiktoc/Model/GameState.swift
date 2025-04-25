//
//  GameState.swift
//  tiktoc
//
//  Created by Mohammad on 2025-04-25.
//

import Foundation

class GameState {
    var board: [GameSquare]
    var currentPlayer: Player
    var isGameOver: Bool
    var winner: Player?

    init() {
        self.board = (0..<9).map { GameSquare(id: $0, player: nil) }
        self.currentPlayer = .x
        self.isGameOver = false
        self.winner = nil
    }
}
