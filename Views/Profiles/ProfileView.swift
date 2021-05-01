//
//  ProfileView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI
import FirebaseAuth
enum ViewPresented {
    case signup, signin
}

struct ProfileView: View {
    
    @EnvironmentObject var userSession: UserSession
    @State var isPresentingSignupFlow: Bool = true
    @State var isPresentingLoginFlow: Bool = true
    @State var isPresentingConfirmationFlow: Bool = true
    var isSignedIn: Bool {
        Auth.auth().currentUser != nil
    }

    var viewPresented: ViewPresented?
    
    var body: some View {
        if userSession.presentProfile {
            NavigationView {
                ZStack {
                    Color.white
                    
                    ScrollView(showsIndicators: false) {
                        VStack {
                            
                            Spacer().frame(height: 50)
                            HStack {
                                Text("Your profile")
                                .font(.title)
                                .fontWeight(.bold)
                                Spacer()
                            }
                            Spacer().frame(height: 50)
                            if Auth.auth().currentUser?.isEmailVerified == false {
                                NavigationLink(
                                    destination: EmailConfirmationView(displayNextOne: $isPresentingConfirmationFlow)
                                        .environmentObject(self.userSession), // change presentProfile to a userSession variable
                                    // pass it down and bind it based off the user is signed in or not vs. the presentProfile variable -- remove presentProfile
                                    label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 20)
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 90)
                                                .foregroundColor(.white)
                                                .animation(.linear)
                                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)), radius: 20)
                                            
                                            HStack {
                                                Text("Verify email to add GPUs 🎉")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.black)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.gray)
                                                
                                            }
                                            .padding(.horizontal, 20)
                                               
                                        }
                                    }
                                ).disabled(!isPresentingConfirmationFlow)
                                .onAppear {
                                    isPresentingConfirmationFlow = true
                                }
                            }
                            Button {
                                do {
                                    try Auth.auth().signOut()
                                    userSession.presentProfile = false
                                } catch {
                                    print("")
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 90)
                                        .foregroundColor(.white)
                                        .animation(.linear)
                                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)), radius: 20)
                                    HStack {
                                        Text("Log Out")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                               
                                        
                                        
                                    }
                                    .padding(.horizontal, 20)
                                }
                            }

                                    
                                
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .animation(.spring())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        } else {
            NavigationView {
                ZStack {
                    Color.white
                    
                    ScrollView(showsIndicators: false) {
                        VStack {
                            
                            Spacer().frame(height: 50)
                            HStack {
                                Text("Create an account to track GPUs ")
                                .font(.title)
                                .fontWeight(.bold)
                                Spacer()
                            }
                            Spacer().frame(height: 50)
                            NavigationLink(
                                destination: SignupView(displayNextOne: $isPresentingSignupFlow)
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
                            ).disabled(!isPresentingSignupFlow)
                            .onAppear {
                                isPresentingSignupFlow = true
                            }
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
                .animation(.spring())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
