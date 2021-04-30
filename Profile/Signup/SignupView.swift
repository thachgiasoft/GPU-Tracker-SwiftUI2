//
//  SignupView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var userSession: UserSession
    @StateObject var signupViewModel: SignupViewModel = SignupViewModel()
    
    @State var email: String = ""
    @State var password: String = ""
  
    var body: some View {
        ZStack {
            Color.white
            ZStack {
                Color.white
                
                NavigationLink(destination: NavigationLazyView(EmailConfirmationView().environmentObject(userSession)),
                                                               isActive: $signupViewModel.canSignUp, label: {})
                
                
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Let's get that RTX 💯")
                            .font(.title)
                            .fontWeight(.bold)
                            Spacer()
                        }
                        Spacer().frame(height: 20)
                        InputField(placeholderText: "Email", inputFieldData: $signupViewModel.emailField)
                        Spacer().frame(height: 20)
                        InputField(placeholderText: "Password", inputFieldData: $signupViewModel.passwordField)
                        
                        Spacer().frame(height: 50)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.clear)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4394139051, green: 0.9035461545, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4777215719, green: 0.5102934241, blue: 0.9995983243, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(15)
                                .shadow(color: Color(#colorLiteral(red: 0.4510196447, green: 0.7518830895, blue: 1, alpha: 0.3878421059)), radius: 20)
                            Button(action: {
                                userSession.email = email
                                userSession.password = password
                                signupViewModel.checkFields()
                            }, label: {
                                CustomButton(text: "Continue")
                            })
                            
                            
                            .padding(.horizontal, 20)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .padding(.bottom, 20)
                        ForEach(signupViewModel.errors, id: \.self) { error in
                            HStack {
                                Text(error)
                                    .font(.system(.body))
                                    .foregroundColor(.red)
                                Spacer()
                            }
                            Spacer().frame(height: 30)
                            
                        }
                        
                    }
                    .padding(30)
                }
            }
            
            .animation(.spring())
        }.onAppear {
            withAnimation {
                userSession.navbarDisplaying = false   
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
