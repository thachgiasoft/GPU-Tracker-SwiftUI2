//
//  EmailConfirmationView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI
import FirebaseAuth

struct EmailConfirmationView: View {
    @EnvironmentObject var userSession: UserSession
    @State var errorMessage: String?
    @Binding var displayNextOne: Bool
    #warning("Please make this a viewmodel!")
    
    var body: some View {
        ZStack { 
            Color.white
            ZStack {
                Color.white
            
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Email sent to \(userSession.email)")
                            .font(.title3)
                            .fontWeight(.bold)
                            Spacer()
                        }
                        Spacer().frame(height: 50)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.clear)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4394139051, green: 0.9035461545, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4777215719, green: 0.5102934241, blue: 0.9995983243, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(15)
                                .shadow(color: Color(#colorLiteral(red: 0.4510196447, green: 0.7518830895, blue: 1, alpha: 0.3878421059)), radius: 20)
                            Button(action: {
                                print(Auth.auth().currentUser)
                                print(Auth.auth().currentUser?.isEmailVerified)
                                Auth.auth().currentUser?.reload(completion: { error in
                                    if let error = error {
                                        
                                        self.errorMessage = error.localizedDescription
                                    } else {
                                        if Auth.auth().currentUser?.isEmailVerified == true {
                                            // unwrap navigationview
                                            
                                            userSession.presentProfile = true
                                            displayNextOne = false
                                        } else {
                                            withAnimation {
                                                self.errorMessage = "Please verify your email."
                                            }
                                        }
                                    }
                                })
                                
                            }, label: {
                                CustomButton(text: "Confirm Email")
                            })
                            .padding(.horizontal, 20)
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        
                        Button(action: {
                            Auth.auth().currentUser?.sendEmailVerification(completion: { error in
                                if let error = error {
                                    withAnimation {
                                        self.errorMessage = error.localizedDescription
                                    }
                                }
                            })
                        }, label: {
                            Text("Resend")
                                .foregroundColor(.gray)
                        })
                        .padding(.top, 10)
                        .padding(.bottom, 20)

                        HStack {
                            if let errorMessage = errorMessage {
                                Text(errorMessage)
                                    .font(.system(.body))
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                        Spacer().frame(height: 30)
                        
                    }
                    .padding(30)
                }
            }
        }
    }

}
//
//struct EmailConfirmationView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmailConfirmationView()
//    }
//}
