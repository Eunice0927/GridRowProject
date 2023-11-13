//
//  ContentViewModel.swift
//  GridRowProject
//
//  Created by Eunsu JEONG on 11/13/23.
//

import Foundation

class ContentViewModel: ObservableObject {
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
