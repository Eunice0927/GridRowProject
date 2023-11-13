//
//  ContentViewModel.swift
//  GridRowProject
//
//  Created by Eunsu JEONG on 11/13/23.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    var gridStatus = [0: true, 1: true, 2: true, 3: true, 4: true, 5: true, 6: true, 7: true, 8: true, 9: true, 10: true, 11: true, 12: true, 13: true, 14: true, 15: true, 16: true, 17: true, 18: true, 19: true, 20: true]
    var randomInts = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].shuffled()
    var color: [Color] = [.yellow, .green, .purple].shuffled()
    var previousIndex = 1
    var showEndView: Bool = false
    @Published var title = ""
    var startTime: Date = Date()
    var endTime: Date = Date()
    @Published var playtime: String = ""
    
    func setEndTime() {
        endTime = Date()
        playtime = String("\(round(endTime.timeIntervalSince(startTime)*100)/100)초")
    }
    
    enum GameEnd {
        case gameOver
        case gameSuccess
    }

    func gameStatus(_ status: GameEnd) {
        switch status {
        case .gameOver:
            if previousIndex == 1{
                playtime = ""
            } else {
                setEndTime()
            }
            title = "실패😭"
            showEndView = true
        case .gameSuccess:
            title = "성공🎉"
            showEndView = true
        }
    }
}
