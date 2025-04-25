//
//  SwiftUIView.swift
//  tiktoc
//
//  Created by Mohammad on 2025-04-25.
//

import SwiftUI

class TicTacToeViewModel: ObservableObject {
    @Published var board: [GameSquare] = []
    @Published var currentPlayer: Player = .x
    @Published var isGameOver: Bool = false
    @Published var winner: Player? = nil

    var winnerText: String {
        if let winner = winner {
            return "\(winner) Wins!"
        } else {
            return "It's a Tie!"
        }
    }
    
    init() {
        resetGame()
    }

    func resetGame() {
        board = (0..<9).map { GameSquare(id: $0, player: nil) }
        currentPlayer = .x
        isGameOver = false
        winner = nil
    }
    
    func makeMove(at index: Int) {
        guard !isGameOver else { return }
        guard board[index].player == nil else { return }

        board[index].player = currentPlayer

        if checkWin(for: currentPlayer) {
            isGameOver = true
            winner = currentPlayer
        } else if board.allSatisfy({ $0.player != nil }) {
            isGameOver = true
            winner = nil // It's a tie
        } else {
            currentPlayer = currentPlayer == .x ? .o : .x
        }
    }
    
    
    func checkWin(for player: Player) -> Bool {
        let winPatterns: Set<Set<Int>> = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ]

        let playerPositions = Set(board.filter { $0.player == player }.map { $0.id })

        for pattern in winPatterns {
            if pattern.isSubset(of: playerPositions) {
                return true
            }
        }
        
        return false
    }
    
}
