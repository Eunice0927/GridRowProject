//
//  GameEnd.swift
//  GridRowProject
//
//  Created by Eunsu JEONG on 11/13/23.
//

import Foundation

enum GameEnd {
    case gameOver
    case gameSuccess
}

func gameStatus(_ status: GameEnd) {
    let previousIndex: Int = 1
    let playtime: String
    let title: String
    let showEndView: Bool
    
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
