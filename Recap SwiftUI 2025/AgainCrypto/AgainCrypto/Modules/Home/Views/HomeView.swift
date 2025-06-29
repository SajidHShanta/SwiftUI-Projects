//
//  HomeView.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 23/6/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeVM
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // background
                Color.theme.background
                    .ignoresSafeArea()
                
                //content layer
                VStack {
                    homeHeader
                    
                    HStack {
                        Text("Coin")
                        Spacer()
                        if showPortfolio {
                            Text("Holdings")
                        }
                        Text("Price")
                            .frame(width: geo.size.width / 2.8, alignment: .trailing)
                    }
                    .font(.caption)
                    .foregroundStyle(.secondaryText)
                    .padding(.horizontal)
                    
                    if !showPortfolio {
                        allCoinList
                            .transition(.move(edge: .leading))
                    } else {
                        portfolioCoinList
                            .transition(.move(edge: .trailing))
                    }
                    
                    
                    
                    Spacer(minLength: 0)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .toolbar(.hidden)
    }
    .environmentObject(PreviewValues.homeVM)
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(nil, value: showPortfolio)
            //                        .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(nil, value: showPortfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                    
                }
            
        }
        .padding(.horizontal)
    }
    
    private var allCoinList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 25, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 25, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
}
