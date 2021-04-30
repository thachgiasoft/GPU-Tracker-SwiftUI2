//
//  PasswordResetView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI
import FirebaseAuth

struct PasswordResetView: View {
    @EnvironmentObject var userSession: UserSession
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var errors: [String] = []
    var body: some View {
        ZStack {
            Color.white
            ZStack {
                Color.white
            
                ScrollView(showsIndicators: false) {
                    VStack {
                        
                        HStack {
                            Text("Reset sent to bot.developer3@gmail.com")
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
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                CustomButton(text: "Back to login")
                            })
                            .padding(.horizontal, 20)
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        
                        Button(action: {
                            errors = []
                            Auth.auth().sendPasswordReset(withEmail: userSession.email) { error in
                                if let error = error {
                                    withAnimation {
                                        errors.append(error.localizedDescription)
                                    }
                                } else {
                                    withAnimation {
                                        errors.append("Reset sent!")
                                    }
                                }
                            }
                        }, label: {
                            Text("Resend")
                                .foregroundColor(.gray)
                        })
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                        ForEach(errors, id: \.self) { error in
                            HStack {
                                Text(error)
                                    .font(.system(.body))
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            Spacer().frame(height: 30)
                            
                        }
                        
                    }
                    .padding(30)
                }
            }
        }
    }
}

