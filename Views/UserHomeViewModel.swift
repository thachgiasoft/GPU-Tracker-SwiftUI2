//
//  UserHomeViewModel.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth


class UserHomeViewModel: ObservableObject {
    @Published var itemCurrentlyShown: GPUItem?
    @Published var gpuData: [GPUItem] = []
    init() {
        fetchDataFromFirebase()
    }
    func fetchDataFromFirebase() {
        if let uid = Auth.auth().currentUser?.uid {
            Firestore.firestore().collection("users").document(uid).collection("trackedItems").getDocuments { trackedItems, trackingError in
                if let items = trackedItems?.documents {
                    for item in items {
                        let data = item.data()
                        if let brandName = data["brandName"] as? String,
                           let imageName = data["imageName"] as? String,
                           let itemID = data["itemID"] as? Int,
                           let itemName = data["itemName"] as? String {
                            let gpuItem = GPUItem( itemID: itemID,
                                                  itemName: itemName,
                                                  imageName: imageName,
                                                  brandName: brandName,
                                                  availabilityStatus: .available,
                                                  price: 30)
                            self.gpuData.append(gpuItem)
                        }
                     }
                }
            }
        }
    }
}
