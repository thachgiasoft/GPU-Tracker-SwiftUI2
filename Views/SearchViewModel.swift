//
//  File.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI
import FirebaseDatabase

class SearchViewModel: ObservableObject {
    @Published var itemCurrentlyShown: GPUItem?
    @Published var gpuData: [GPUItem] = []
    init() {
        fetchDataFromFirebase()
    }
    func fetchDataFromFirebase() {
        let reference = Database.database().reference()
        reference.child("/0/gpus/").getData { (error, snapshot) in
            for child in snapshot.children {
                if let childPoint = child as? DataSnapshot {
                    
                    let itemDictionary = childPoint.value as? Dictionary<String, Any>
                    if let itemName = itemDictionary?["itemName"] as? String,
                       let imageName = itemDictionary?["imageName"] as? String,
                       let brandName = itemDictionary?["brandName"] as? String,
                       let itemID = itemDictionary?["id"] as? Int {
                        let itemData = GPUItem(itemID: itemID,
                                               itemName: itemName,
                                               imageName: imageName,
                                               brandName: brandName,
                                               availabilityStatus: .available,
                                               price: nil)
                        DispatchQueue.main.async {
                            self.gpuData.append(itemData)
                        }
                    }
                    
                }
            }
        }
    }
}
