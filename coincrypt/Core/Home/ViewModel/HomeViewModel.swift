//
//  HomeViewModel.swift
//  coincrypt
//
//  Created by J C on 5/31/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init(){
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else {return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print("DEBUG: Error\(error.localizedDescription)")
                return
            }
            
            // check if we are getting a successful response
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response code\(response.statusCode) ")
            }
                
            guard let data = data else { return }
            
            do{
                let coin = try JSONDecoder().decode([Coin].self, from: data)
//                print("DEBUG: coins \(coin)")
                DispatchQueue.main.async {
                    self.coins = coin
                    self.configureTopMovingCoins()
                }
            } catch let error {
                print("DEBUG: Failed to decode with error: \(error)")
            }
            //print data as a string
            // let dataAsString = String(data: data, encoding: .utf8)
            
            
            
        }.resume()
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
