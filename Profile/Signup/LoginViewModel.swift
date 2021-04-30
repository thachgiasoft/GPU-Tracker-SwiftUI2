//
//  LoginViewModel.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//


import SwiftUI
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    @Published var errors: [String] = []
    
    @Published var displayPasswordReset: Bool = false
    
    func checkFields(completion: @escaping(Bool) -> Void) {
        errors = []
        let emailIsValid = isValidEmail(emailField)
        let passwordIsValid = passwordField.trimmingCharacters(in: .whitespacesAndNewlines).count >= 8
        var isValid: Bool = true
        if !emailIsValid {
            withAnimation {
                errors.append("Email is invalid")
            }
            isValid = false
        }
        if !passwordIsValid {
            withAnimation {
                errors.append("Password must be 8+ characters long")
            }
            isValid = false
        }
        
        if isValid {
            Auth.auth().signIn(withEmail: emailField, password: passwordField) { result, error in
                if let error = error {
                    withAnimation {
                        self.errors.append(error.localizedDescription)
                    }
                    completion(false)
                } else {
                    completion(true)
                }
            }
        } else {
            completion(false)
        }
        
    }
    func sendPasswordReset() {
        self.errors = []
        Auth.auth().sendPasswordReset(withEmail: emailField) { error in
            if let error = error {
                withAnimation {
                    self.errors.append(error.localizedDescription)
                }
            } else {
                self.displayPasswordReset = true
            }
        }
    }
    
}

