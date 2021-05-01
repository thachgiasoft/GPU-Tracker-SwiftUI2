//
//  ItemModel.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI

struct GPUItem: Hashable, Identifiable {
    var id = UUID()
    var itemID: Int = 0
    var itemName = ""
    var imageName = ""
    var brandName = ""
    var availabilityStatus: ItemStatus = .unavailable
    var price: Int?
    func documentData() -> [String: Any] {
        return [
            "itemID": itemID,
            "itemName": itemName,
            "imageName": imageName,
            "brandName": brandName
        ]
    }
    
}
