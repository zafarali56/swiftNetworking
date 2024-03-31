//
//  CoinsViewModel.swift
//  Networking
//
//  Created by Zafar Ali on 29/03/2024.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coin = ""
    @Published var price = ""
    
    init() {
        fetchPrice(coin: "ethereum" , currency: "eur")
    }
    
    func fetchPrice(coin: String, currency: String)
    {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=\(currency)"
        guard let url = URL(string: urlString) else {return}
        print("Fetching price...")
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Did recieve data \(data)")
            guard let data = data else {return}
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {return}
            print(jsonObject)
            
            guard let value = jsonObject[coin] as? [String: Double] else {
                print("Failed to parse the value" )
                    return
            }
            guard let price = value [currency] else {return}
            DispatchQueue.main.async{
                self.coin = coin.capitalized
                self.price = "\(price) \(currency)"
            }
        }.resume()
        print("Did reach end of function...")
    }
}
