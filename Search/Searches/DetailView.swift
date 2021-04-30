//
//  DetailView.swift
//  GPU-Tracker-SwiftUI
//
//  Created by Pink Flamingo on 4/29/21.
//

import SwiftUI
import SwiftUICharts

struct DetailView: View {
    var retailers = ["amazon", "adorama", "amd", "antonline", "asus", "bestbuy", "bnh", "newegg", "officedepot", "staples", "walmart", "zotac"]
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                Color.white
                VStack {
                    HStack {
                        Image(systemName: "chevron.left")
                        
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
                                    Image("3090")
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
                                Text("RTX 2080 ti")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            HStack {
                                Text("NVIDIA")
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
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.clear)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4394139051, green: 0.9035461545, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4777215719, green: 0.5102934241, blue: 0.9995983243, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(15)
                                    .shadow(color: Color(#colorLiteral(red: 0.4510196447, green: 0.7518830895, blue: 1, alpha: 0.3878421059)), radius: 20)
                                HStack {
                                    Text("Track GPU")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 20)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
