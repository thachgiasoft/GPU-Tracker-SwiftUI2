//
//  DetailViewModel.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

enum mode { case addItem, removeItem, redirect }

class DetailViewModel: ObservableObject {
    @Published var currentMode: mode?
    @Published var displayedItem: GPUItem?
    
    func addDisplayedItem() {
        if let user = Auth.auth().currentUser,
           user.isEmailVerified == true,
           let displayedItem = displayedItem {
            let userDocRef = Firestore.firestore()
                .collection("users")
                .document(user.uid)
            userDocRef.collection("trackedItems")
                .document("\(displayedItem.itemID)")
                .setData(displayedItem.documentData())
            
        }
    }
    func removeDisplayedItem() {
        if let user = Auth.auth().currentUser,
           user.isEmailVerified == true,
           let displayedItem = displayedItem {
            let userDocRef = Firestore.firestore()
                .collection("users")
                .document(user.uid)
            userDocRef.collection("trackedItems")
                .document("\(displayedItem.itemID)")
                .delete()
            
        }
    }
    func getCurrentMode() {
        
        if let user = Auth.auth().currentUser,
           user.isEmailVerified==true {
            
            if let displayedItem = self.displayedItem {
                
                let userDocRef = Firestore.firestore()
                    .collection("users")
                    .document(user.uid)
                
                userDocRef.collection("trackedItems").getDocuments { trackedItemSnapshot, trackedItemError in
                    if let trackedItemError = trackedItemError {
                        #warning("Unhandled exception")
                        print(trackedItemError.localizedDescription)
                        self.currentMode = .redirect
                    } else {
                        if let documents = trackedItemSnapshot?.documents {
                            var canAddItem = true
                            let itemID = "\(displayedItem.itemID)"
                            if documents.count > 0 {
                                for doc in documents  {
                                    print(doc.documentID)
                                    print(itemID)
                                    if doc.documentID == itemID {
                                        canAddItem = false
                                        self.currentMode  = .removeItem
                                        
                                        break
                                    }
                                }
                            }
                            if canAddItem {
                                self.currentMode = .addItem
                            }
                        }
                    }
                }
            }
        
        } else {
            self.currentMode = .redirect
        }
    }
}
