//
//  TicTacToeTests.swift
//  tiktocTests
//
//  Created by Mohammad on 2025-04-25.
//

import XCTest
@testable import tiktoc

final class TicTacToeTests: XCTestCase {
    
    func testTopRowWinForX() {
        let viewModel = TicTacToeViewModel()

        viewModel.board[0].player = .x
        viewModel.board[1].player = .x
        viewModel.board[2].player = .x

        let result = viewModel.checkWin(for: .o)
        XCTAssertFalse(result, "Player O should win with top row")
    }
    
    func testDiagonalWinForO() {
        let viewModel = TicTacToeViewModel()

        viewModel.board[0].player = .o
        viewModel.board[4].player = .o
        viewModel.board[8].player = .o

        let result = viewModel.checkWin(for: .o)

        XCTAssertTrue(result, "Player O should win with diagonal")
    }

    func testNoWinYet() {
        let viewModel = TicTacToeViewModel()

        viewModel.board[0].player = .x
        viewModel.board[1].player = .o
        viewModel.board[2].player = .x

        let result = viewModel.checkWin(for: .x)

        XCTAssertFalse(result, "Player X should not win yet")
    }

    func testMakeMoveAssignsPlayerCorrectly() {
        let viewModel = TicTacToeViewModel()
        
        viewModel.makeMove(at: 0)

        XCTAssertEqual(viewModel.board[0].player, .x)
    }
}
