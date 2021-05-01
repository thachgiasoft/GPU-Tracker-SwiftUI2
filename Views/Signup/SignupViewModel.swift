//
//  SignupViewModel.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI
import FirebaseAuth

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9sa-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

class SignupViewModel: ObservableObject {
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    @Published var errors: [String] = []
    @Published var canSignUp: Bool = false
    
    func checkFields() -> Bool {
        errors = []
        let emailIsValid = isValidEmail(emailField)
        let passwordIsValid = passwordField.trimmingCharacters(in: .whitespacesAndNewlines).count >= 8
        var isValid: Bool = true
        if !emailIsValid {
            errors.append("Email is invalid")
            isValid = false
        }
        if !passwordIsValid {
            errors.append("Password must be 8+ characters long")
            isValid = false
        }
        
        return isValid
    }
    
    func sendConfirmationEmail() {
        errors = []
        if let user = Auth.auth().currentUser, !user.isEmailVerified {
            
            user.sendEmailVerification { [weak self] error in
                guard let self = self else { return }
                if let error = error {
                    self.errors.append(error.localizedDescription)
                } else {
                    // no error detectefd
                    self.canSignUp = true
                }
                
            }
            
        }
    }
    
    func transitionToEmailConfirmation() {
        // create the account
            // send email confirmation
            // or display error
        errors = []
        Auth.auth().createUser(withEmail: emailField, password: passwordField) { [weak self] authResult, error in
            guard let self = self else { return }

            if let error = error {
                // error occured
                self.errors.append("\(error.localizedDescription)")
            } else {
                
                self.sendConfirmationEmail()
                
            }

        }
    }
}
