//
//  SelectionItem.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/30/21.
//

import SwiftUI
func generateItemName(item: GPUItem) -> Text {

    var availabilityText = item.availabilityStatus.rawValue
    if let price = item.price {
        availabilityText = "\(availabilityText) - last $\(price)"
    }
    
    switch item.availabilityStatus {
        case .available:
            return Text(availabilityText)
                .font(.caption)
                .foregroundColor(.green)
        case .availableScalper:
            return Text(availabilityText)
                .font(.caption)
                .foregroundColor(.yellow)
        case .unavailable:
            return Text(availabilityText)
                .font(.caption)
                .foregroundColor(.red)
    }
    
}
struct SelectionItem: View {
    var item: GPUItem
    let tolerance: CGFloat = 100
    @Binding var isPresentingItem: GPUItem?
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
                .padding(.trailing, !isPresentingMoreDataView ? 0 : tolerance)
                .animation(.easeIn(duration: 0.2))
            HStack {
                VStack {
                    Image(item.imageName)
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
                        Text(item.itemName)
                            .font(.body)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text(item.brandName)
                            .font(.caption)
                        Spacer()
                    }
                    
                    HStack {
                        generateItemName(item: item)
                        Spacer()
                    }
                    Spacer()
                    
                }
                Spacer()
                Button(action: {
                    self.isPresentingItem = self.item
                    
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
                .padding(.trailing, !isPresentingMoreDataView ? 0 : 0)
                .animation(.linear(duration: 0.2))
                
                
                
            }
            
                
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .padding()
        
    }
}

//
//struct SelectionItem_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectionItem(item: GPUItem(itemName: "3070", imageName: "3070", brandName: "nvidia", availabilityStatus: .available, price: 20))
//    }
//}
