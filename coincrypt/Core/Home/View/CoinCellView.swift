//
//  CoinCellView.swift
//  coincrypt
//
//  Created by J C on 5/30/23.
//

import SwiftUI
import Kingfisher

struct CoinCellView: View {
    let coin: Coin
    var body: some View {
        HStack{
            // id number
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)
           // image
            KFImage(URL(string: coin.image))
                .resizable()
                .foregroundColor(.orange)
                .scaledToFit()
                .frame(width: 32, height: 32)
            // coin name info
            VStack(alignment: .leading){
                Text(coin.name)
                    .fontWeight(.bold)
                    .font(.subheadline)
                
                Text(coin.symbol.uppercased())
                    .font(.footnote)
            }
            
            Spacer()
            
            //coin price infor
            VStack(alignment: .trailing){
                Text(coin.currentPrice.toCurrency())
                    .fontWeight(.bold)
                    .font(.subheadline)
                
                Text(coin.priceChangePercentage24H.toPercentString())
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                    .font(.footnote)
            }
        }
        .padding(.horizontal)
    }
}

//struct CoinCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinCellView()
//    }
//}
