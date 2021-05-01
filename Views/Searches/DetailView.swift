//
//  DetailView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI
import SwiftUICharts
import FirebaseAuth
import FirebaseFirestore

struct DetailView: View {
    @ObservedObject var detailViewModel: DetailViewModel = DetailViewModel()
    @EnvironmentObject var userSession: UserSession
    
    init(displayedItem: GPUItem) {
        self.setItem(displayedItem: displayedItem)
    }
    func setItem(displayedItem: GPUItem) {
        print(displayedItem)
        detailViewModel.displayedItem = displayedItem
        detailViewModel.getCurrentMode()
        print()
    }
    var retailers = ["amazon", "adorama", "amd", "antonline", "asus", "bestbuy", "bnh", "newegg", "officedepot", "staples", "walmart", "zotac"]
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                Color.white
                VStack {
                    HStack {
                        Button(action: {
                            self.detailViewModel.displayedItem = nil
                        }) {
                            Image(systemName: "chevron.left")
                        }
                        Text("Price History")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    ZStack {
                        let prices: [Double] = [8,23,54,32,12,37,7,23,43] // will change
                        if let maxPrice = prices.max(),
                           let minPrice = prices.min(),
                           let priceRange = maxPrice - minPrice,
                           let totalUpDistance = CGFloat(prices[prices.count-1]/priceRange)*200 {
                            LineView(data: prices, style: Styles.barChartStyleNeonBlueLight)
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Image(detailViewModel.displayedItem?.imageName ?? "")
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(0.5)
                                        .frame(height: 100)
                                        .padding(.bottom, totalUpDistance-50-20)
                                        
                                    
                                }
                                
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    
                    Spacer()
                        
                    
                }
                .padding(.top, 30)
                .padding(.horizontal, 20)
                VStack {
                    ZStack {
                        Color.white
                        VStack {
                            HStack {
                                Text(detailViewModel.displayedItem?.itemName ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            HStack {
                                Text(detailViewModel.displayedItem?.brandName ?? "")
                                    .font(.body)
                                Spacer()
                            }
                            HStack {
                                Text("Available via scalper 💰 -- Amazon")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.yellow)
                                Spacer()
                            }
                            Spacer()
                                .frame(height: 20)
                            if let currentMode = detailViewModel.currentMode {
                                Button(action: {
                                    if detailViewModel.currentMode == .addItem {
                                        detailViewModel.addDisplayedItem()
                                    } else if detailViewModel.currentMode == .removeItem {
                                        detailViewModel.removeDisplayedItem()
                                    }
                                    self.userSession.currentSelectedPage = .home
                                    self.detailViewModel.displayedItem = nil
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(.clear)
                                            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4394139051, green: 0.9035461545, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4777215719, green: 0.5102934241, blue: 0.9995983243, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                                            .cornerRadius(15)
                                            .shadow(color: Color(#colorLiteral(red: 0.4510196447, green: 0.7518830895, blue: 1, alpha: 0.3878421059)), radius: 20)
                                        HStack {
                                            if currentMode == .addItem {
                                                Text("Track GPU")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                            } else {
                                                Text("Remove GPU")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                            }
                                            
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                        }
                                        .padding(.horizontal, 20)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                }
                                .onAppear {
                                    print(currentMode)
                                    if currentMode == .redirect {
                                        self.userSession.currentSelectedPage = .profile
                                        self.detailViewModel.displayedItem = nil
                                    }
                                }
                            } else {
                                ProgressView()
                            }
                            Spacer()
                                .frame(height: 20)
                            
                            VStack(spacing: 20) {
                                ForEach(retailers, id: \.self ) { retailer in
                                    ZStack {
                                        
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 100)
                                            .foregroundColor(.white)
                                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 20)
                                        HStack {
                                            
                                            VStack {
                                                Spacer()
                                                Image(retailer)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50)
                                                    .shadow(radius: 20, y: 4)
                                                Spacer()
                                                
                                            }
                                            .padding(.leading, 20)
                                            .padding(.top, 20)
                                            .padding(.bottom, 20)
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    Text("Amazon")
                                                        .font(.body)
                                                        .fontWeight(.bold)
                                                    Spacer()
                                                HStack {
                                                    Text("Out of stock 😭")
                                                        .font(.caption)
                                                        .foregroundColor(.red)
                                                    Spacer()
                                                }

                                                }
                                                HStack {
                                                    Text("$399 last price")
                                                        .font(.caption)
                                                        .foregroundColor(.red)
                                                    Spacer()
                                                }
                                                Spacer()
                                                
                                            }
                                            Spacer()
                                            VStack {
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.black)
                                                    .padding(.trailing, 10)
                                                Spacer()
                                            }
                                            Spacer()
                                                .frame(width: 10)
                                            

                                        }
                                        
                                    }
                                }
                                Spacer()
                                    .frame(height: 100)
                                
                                
                            }
                            
                            
                            Spacer()
                            
                        }
                        .padding(20)
                        .padding(.top, 10)
                    }
                    
                    .cornerRadius(20)
                    .padding(.top,400)
                    .padding(.bottom, -100)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 20)
                    
                    
                }
            }
        }
    }
}
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
