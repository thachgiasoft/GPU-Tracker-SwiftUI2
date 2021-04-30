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
    
    
    
    func sendEmailConfirmation() {
        
    }
    
    func signinAccount() {
        
    }
    func sendPasswordReset() {
        
    }
    
    
}
