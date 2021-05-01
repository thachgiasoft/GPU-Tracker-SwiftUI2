//
//  UserHomeView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI

struct UserHomeView: View {
    @ObservedObject var userHomeViewModel: UserHomeViewModel = UserHomeViewModel()
    var body: some View {
        ZStack {
            Color.white
        
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    Spacer().frame(height: 100)
                    Text("Watchlist")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer().frame(height: 50)
                    ForEach(userHomeViewModel.gpuData, id: \.self) { itemData in
                        SelectionItem(item: itemData, isPresentingItem: $userHomeViewModel.itemCurrentlyShown)
                        
                    }
                    Spacer().frame(height: 200)
                
                            
                }
                
                
            }
            .frame(maxHeight: .infinity)
        }
        .animation(.spring())
        
        .ignoresSafeArea()
    }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
