//
//  SearchView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI

enum ItemStatus: String {
    case available = "Item is available 🙌"
    case availableScalper = "Item is available from scalper 💰"
    case unavailable = "Item is unavailable "
}

struct SearchView: View {
    @StateObject var searchViewModel: SearchViewModel = SearchViewModel()
    @EnvironmentObject var userSession: UserSession
    var body: some View {
        ZStack {
            Color.white
        
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    Spacer().frame(height: 100)
                    Text("Add items to track")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer().frame(height: 50)
                    if searchViewModel.gpuData.count > 0 {
                        ForEach(searchViewModel.gpuData, id: \.self) { itemData in
                            SelectionItem(item: itemData, isPresentingItem: $searchViewModel.itemCurrentlyShown)
                            
                        }
                    } else {
                        ProgressView()
                    }
                    Spacer().frame(height: 200)
                }
                
                
            }
            .frame(maxHeight: .infinity)
        }
        .animation(.spring())
        .ignoresSafeArea()
        .sheet(item: $searchViewModel.itemCurrentlyShown) { itemCurrentlyShown in
            DetailView(displayedItem: itemCurrentlyShown)
                .environmentObject(userSession)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
