//
//  ProfileView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI
enum ViewPresented {
    case signup, signin
}
struct ProfileView: View {
    
    @EnvironmentObject var userSession: UserSession
    
    var viewPresented: ViewPresented?

    var body: some View {
        
        NavigationView {
            ZStack {
                Color.white
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        
                        Spacer().frame(height: 50)
                        HStack {
                            Text("Create an account or log in")
                            .font(.title)
                            .fontWeight(.bold)
                            Spacer()
                        }
                        Spacer().frame(height: 50)
                        NavigationLink(
                            destination: SignupView()
                                .environmentObject(self.userSession),
                            label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 90)
                                        .foregroundColor(.white)
                                        .animation(.linear)
                                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)), radius: 20)
                                    
                                    HStack {
                                        Text("Sign up")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                        
                                    }
                                    .padding(.horizontal, 20)
                                       
                                }
                            }
                        )
                        NavigationLink(
                            destination: LoginView()
                                .environmentObject(self.userSession),
                            label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 90)
                                        .foregroundColor(.white)
                                        .animation(.linear)
                                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)), radius: 20)
                                    HStack {
                                        Text("Log In")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                               
                                        
                                        
                                    }
                                    .padding(.horizontal, 20)
                                }
                            }
                        )
                    }
                    .padding(.horizontal, 20)
                }
            }
            .onAppear {
                withAnimation {
                    userSession.navbarDisplaying = true
                }
            }
            .animation(.spring())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
