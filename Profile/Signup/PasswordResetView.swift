//
//  PasswordResetView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI

struct PasswordResetView: View {
    var body: some View {
        ZStack {
            Color.white
            ZStack {
                Color.white
            
                ScrollView(showsIndicators: false) {
                    VStack {
                        Spacer().frame(height: 50)
                        HStack {
                            Image(systemName: "chevron.left")
                            Spacer().frame(width: 20)
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
                            Button(action: {}, label: {
                                CustomButton(text: "Back to login")
                            })
                            .padding(.horizontal, 20)
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        
                        Button(action: {}, label: {
                            Text("Resend")
                                .foregroundColor(.gray)
                        })
                        .padding(.top, 10)
                        
                    }
                    .padding(30)
                }
            }
        }
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}
