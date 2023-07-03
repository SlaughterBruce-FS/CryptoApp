//
//  AllCoinsView.swift
//  coincrypt
//
//  Created by J C on 5/30/23.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack{
                Text("Coin")
                    
                Spacer()
                
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins) { coin in
                        CoinCellView(coin: coin)
                    }
                }
            }
           
        }
        
    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
