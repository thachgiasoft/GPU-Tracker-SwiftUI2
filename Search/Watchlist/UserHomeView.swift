//
//  UserHomeView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI

struct SelectionItem: View {
    let imageName = "3090"
    @State var isPresentingMoreDataView: Bool = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(maxWidth: .infinity)
                .frame(height: 90)
                .foregroundColor(.gray)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)), radius: 20)
            RoundedRectangle(cornerRadius: 20)
                .frame(maxWidth: .infinity)
                .frame(height: 90)
                .foregroundColor(.white)
                .padding(.trailing, !isPresentingMoreDataView ? 0 : 50)
                .animation(.linear)
            HStack {
                VStack {
                    Image("6700xt")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140)
                        .shadow(radius: 20, y: 4)
                        
                    Spacer()
                }
                .padding(.leading, 10)
                .padding(.top, -20)
                .padding(.bottom, 20)
                VStack {
                    Spacer()
                    HStack {
                        Text("RTX 2080 ti")
                            .font(.body)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text("NVIDIA")
                            .font(.caption)
                        Spacer()
                    }
                    HStack {
                        Text("Available via scalper 💰")
                            .font(.caption)
                            .foregroundColor(.yellow)
                        Spacer()
                    }
                    Spacer()
                    
                }
                Spacer()
                Button(action: {
                    isPresentingMoreDataView.toggle()
                    
                }) {
                    Image(systemName: !isPresentingMoreDataView ? "plus": "minus")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
                .padding(.trailing, !isPresentingMoreDataView ? 0 : 50)
                .animation(.linear)
                
            }
            
                
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .padding()
        
    }
}
struct UserHomeView: View {
    var body: some View {
        ZStack {
            Color.white
        
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    Spacer().frame(height: 50)
                    Text("Watchlist")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer().frame(height: 50)
                    SelectionItem()
                    SelectionItem()
                    SelectionItem()
                    SelectionItem()
                    SelectionItem()
                    SelectionItem()
                    SelectionItem()
                    
                    
                }
                
                
            }
            .frame(maxHeight: .infinity)
        }
        
        .ignoresSafeArea()
    }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
