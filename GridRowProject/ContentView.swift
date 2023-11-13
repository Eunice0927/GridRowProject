//
//  ContentView.swift
//  GridRowProject
//
//  Created by Eunsu JEONG on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    @State private var gridStatus = ContentViewModel().gridStatus
    @State private var randomInts = ContentViewModel().randomInts
    @State private var color = ContentViewModel().color
    
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
