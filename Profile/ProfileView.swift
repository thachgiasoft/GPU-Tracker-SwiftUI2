//
//  ProfileView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.white
        
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    Spacer().frame(height: 50)
                    HStack {
                        Text("Profile")
                        .font(.title)
                        .fontWeight(.bold)
                        Spacer()
                    }
                    Spacer().frame(height: 50)
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
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                            
                        }
                        .padding(.horizontal, 20)
                    }
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
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                            
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
