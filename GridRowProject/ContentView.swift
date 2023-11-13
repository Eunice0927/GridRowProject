//
//  ContentView.swift
//  GridRowProject
//
//  Created by Eunsu JEONG on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    @State private var gridStatus = [0: true, 1: true, 2: true, 3: true, 4: true, 5: true, 6: true, 7: true, 8: true, 9: true, 10: true, 11: true, 12: true, 13: true, 14: true, 15: true, 16: true, 17: true, 18: true, 19: true, 20: true]
    @State private var randomInts = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].shuffled()
    @State private var color: [Color] = [.yellow, .green, .purple].shuffled()
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: 50)), count: 4)) {
                ForEach(randomInts, id: \.self) { index in
                    GridCell(viewModel: viewModel, gridStatus: $gridStatus, randomInts: randomInts, color: color, index: index)
                }
            }
            .padding()
            
            if viewModel.showEndView {
                VStack {
                    Text(viewModel.title)
                        .font(.system(size: 80))
                    Text(viewModel.playtime)
                        .font(.system(size: 40))
                }
                .frame(width: 370, height: 500)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .foregroundStyle(.black)
            }
        }
        
        Button {
            reset()
        } label: {
            Text("다시하기")
                .frame(width: 90, height: 40)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .foregroundStyle(.white)
        }
    }
    
    func reset() {
        for i in 0..<gridStatus.count {
            gridStatus[i] = true
        }
        randomInts = randomInts.shuffled()
        color = color.shuffled()
        viewModel.previousIndex = 1
        viewModel.showEndView = false
        viewModel.playtime = ""
        viewModel.startTime = Date()
    }
}

#Preview {
    ContentView()
}
