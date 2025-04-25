//
//  ContentView.swift
//  tiktoc
//
//  Created by Mohammad on 2025-04-25.
//

import SwiftUI

struct Home: View {
    @StateObject private var viewModel = TicTacToeViewModel()

    var body: some View {
        VStack {
            Text("Current Turn: \(viewModel.currentPlayer.rawValue)")
                .font(.title2)
                .padding()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15) {
                ForEach(viewModel.board) { square in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue.opacity(0.2))
                            .cornerRadius(12)

                        Text(square.player?.rawValue ?? "")
                            .font(.system(size: 50))
                            .bold()
                            .foregroundColor(square.player == .x ? .red : .green)
                    }
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        viewModel.makeMove(at: square.id)
                    }
                }
            }

            if viewModel.isGameOver {
                VStack {
                    Text(viewModel.winnerText)
                        .font(.title)
                        .padding(.top)

                    Button("Play Again") {
                        viewModel.resetGame()
                    }
                    .padding(.top)
                }
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    Home()
}
