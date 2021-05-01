//
//  UserSession.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import FirebaseAuth


final class UserSession: ObservableObject {
    
    @Published var navbarDisplaying: Bool = true
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var presentProfile: Bool = Auth.auth().currentUser != nil
    @Published var currentSelectedPage: currentPage = .home
    
    
}
