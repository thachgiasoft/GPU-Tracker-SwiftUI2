//
//  EntryView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI

struct EntryView: View {
    @State var currentSelectedPage: currentPage = .home
    var body: some View {
        ZStack {
            switch currentSelectedPage {
                case .home:
                    UserHomeView()
                case .search:
                    SearchView()
                case .profile:
                    ProfileView()
            }
            VStack {
                Spacer()
                TabBarView(currentSelectedPage: $currentSelectedPage)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
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

