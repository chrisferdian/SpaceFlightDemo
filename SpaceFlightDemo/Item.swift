//
//  Item.swift
//  SpaceFlightDemo
//
//  Created by Indo Teknologi Utama on 26/09/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
