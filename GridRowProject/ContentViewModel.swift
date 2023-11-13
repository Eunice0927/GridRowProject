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
}
