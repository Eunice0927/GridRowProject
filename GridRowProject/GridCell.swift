//
//  ContentModel.swift
//  GridRowProject
//
//  Created by Eunsu JEONG on 11/13/23.
//

import SwiftUI

struct GridCell: View {
    var viewModel: ContentViewModel
    @Binding var gridStatus: [Int: Bool]
    var randomInts: [Int]
    var color: [Color]
    var index: Int
    
    var body: some View {
        if gridStatus[index] ?? true {
            Button {
                if index == 1 {
                    viewModel.startTime = Date()
                }
                
                if index > viewModel.previousIndex {
                    viewModel.gameStatus(.gameOver)
                } else {
                    viewModel.previousIndex = index + 1
                    self.gridStatus[index] = false
                    if index == randomInts.count {
                        viewModel.setEndTime()
                        viewModel.gameStatus(.gameSuccess)
                    }
                }
            } label: {
                Text("\(index)")
                    .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            }
            .background(color[index % color.count])
            .foregroundStyle(.white)
            .cornerRadius(8)
            .font(.largeTitle)
        } else {
            Button("") {
                self.gridStatus[index] = false
            }
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(.clear)
            .cornerRadius(8)
        }
    }
}
