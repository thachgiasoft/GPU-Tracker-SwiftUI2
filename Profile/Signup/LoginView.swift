//
//  LoginView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI
struct InputField: View {
    var placeholderText: String
    @Binding var inputFieldData: String
    var body: some View {
        TextField(placeholderText, text: $inputFieldData)
            .font(.system(size: 15))
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding(.top, 20)
        Rectangle().frame(height: 1).foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
    }
}
struct CustomButton: View {
    var text: String
    var body: some View {
        HStack {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
    }
}
struct LoginView: View {
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    @EnvironmentObject var userSession: UserSession
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Color.white
            ZStack {
                Color.white
                
                NavigationLink(destination:
                                NavigationLazyView(PasswordResetView()
                                                    .environmentObject(userSession)),
                               isActive: $loginViewModel.displayPasswordReset,
                               label: {
                               })
                    
                
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Welcome back 🎉!")
                            .font(.title)
                            .fontWeight(.bold)
                            Spacer()
                        }
                        Spacer().frame(height: 20)
                        InputField(placeholderText: "Email", inputFieldData: $loginViewModel.emailField)
                        Spacer().frame(height: 20)
                        InputField(placeholderText: "Password", inputFieldData: $loginViewModel.passwordField)
                        
                        Spacer().frame(height: 50)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.clear)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4394139051, green: 0.9035461545, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4777215719, green: 0.5102934241, blue: 0.9995983243, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(15)
                                .shadow(color: Color(#colorLiteral(red: 0.4510196447, green: 0.7518830895, blue: 1, alpha: 0.3878421059)), radius: 20)
                            Button(action: {
                                loginViewModel.checkFields(completion: { success in
                                    if success {
                                        self.presentationMode.wrappedValue.dismiss()
                                        
                                    }
                                })
                                
                            }, label: {
                                CustomButton(text: "Continue")
                            })
                            
                            
                            .padding(.horizontal, 20)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        Button(action: {
                            userSession.email = loginViewModel.emailField
                            self.loginViewModel.sendPasswordReset()
                            
                        }, label: {
                            Text("Forgot password?")
                                .foregroundColor(.gray)
                        })
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                        
                        ForEach(loginViewModel.errors, id: \.self) { error in
                            HStack {
                                Text(error)
                                    .font(.system(.body))
                                    .foregroundColor(.red)
                                Spacer()
                            }
                            .animation(.easeIn)
                            Spacer().frame(height: 30)
                            
                        }
                    }
                    .padding(30)
                }
            }
        }.onAppear {
            withAnimation {
                userSession.navbarDisplaying = false
            }
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
