//
//  TabBarView.swift
//  StockX-Clone
//
//  Created by Pink Flamingo on 4/9/21.
//

import SwiftUI


enum currentPage { case home, search, profile }


struct CustomShape: Shape {
    var xAxis: CGFloat
    //100px from bottom
    
    var animatableData: CGFloat {
        get{return xAxis}
        set{xAxis=newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x: center - 50, y: 0))
            let tol = CGPoint(x: center, y: 35)
            let controll = CGPoint(x: center - 25, y: 0)
            let control2 = CGPoint(x: center - 25, y: 35)
            let to2 = CGPoint(x: center + 50, y: 0)
            let control3 = CGPoint(x: center + 25, y: 35)
            let control4 = CGPoint(x: center + 25, y: 0)
            path.addCurve(to: tol, control1: controll, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

struct TabBarViewIcon: View {
    @Binding var currentSelectedPage: currentPage
    
    var image: Image
    var iconSize: CGFloat
    
    var pageName: currentPage
    
    var isSelected: Bool {
        currentSelectedPage == pageName
    }
    
    var body: some View {
        Button(action: {
            currentSelectedPage = pageName
        }, label: {
            image
                .resizable()
                .scaledToFit()
                .foregroundColor(currentSelectedPage == pageName ? Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)) : Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                .frame(width: isSelected ? iconSize+5: iconSize, height: isSelected ? iconSize+5: iconSize)
        })
    }
}

struct TabBarView: View {

    let iconSize: CGFloat = 20
    let tolerance: CGFloat = 30
    @Binding var currentSelectedPage: currentPage
    var body: some View {
        GeometryReader { reader in
            ZStack {
                CustomShape(xAxis: (reader.size.width/2))
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                HStack {
                    Spacer()
                    TabBarViewIcon(currentSelectedPage: $currentSelectedPage, image: Image(systemName: "binoculars"), iconSize: iconSize, pageName: .home)
                    Spacer()
                    ZStack {
                        TabBarViewIcon(currentSelectedPage: $currentSelectedPage, image: Image(systemName: "plus"), iconSize: iconSize, pageName: .search)
                            .padding(.bottom, 60)
                            .shadow(radius: 10)
                    }
                    Spacer()
                    TabBarViewIcon(currentSelectedPage: $currentSelectedPage, image: Image(systemName: "person"), iconSize: iconSize, pageName: .profile)
                    Spacer()
                    
                }
                .padding(.horizontal, 50)
                .padding(.top, -10)
                
    //            }
    //            .frame(maxWidth: .infinity)
    //            .frame(height: iconSize+(tolerance*2))
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, -35)
        }
        
    }
}
//
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(currentSelectedPage: .constant(.profile))
    }
}
