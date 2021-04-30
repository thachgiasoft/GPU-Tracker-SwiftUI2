//
//  EntryView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI

struct EntryView: View {
    @EnvironmentObject var userSession: UserSession
    @State var currentSelectedPage: currentPage = .home
    
    var body: some View {
        ZStack {
            switch currentSelectedPage {
                case .home:
                    UserHomeView()
                        .environmentObject(self.userSession)
                        
                case .search:
                    SearchView()
                        .environmentObject(self.userSession)
                        
                case .profile:
                    ProfileView()
                        .environmentObject(self.userSession)
                        
            }
            VStack {
                Spacer()
                if userSession.navbarDisplaying {
                    TabBarView(currentSelectedPage: $currentSelectedPage)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .animation(.spring())
                }
            }
        }
        .background(EmptyView())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

//struct EntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryView()
//
//    }
//}

