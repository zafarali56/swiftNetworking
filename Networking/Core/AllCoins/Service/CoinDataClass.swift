//
//  CoinDataClass.swift
//  Networking
//
//  Created by Zafar Ali on 04/04/2024.
//

import Foundation

class CoinDataClass {
    func fetchPrice(coin: String, currency: String, completions: @escaping (Double, String) -> Void )
    {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=\(currency)"
        guard let url = URL(string: urlString) else {return}
        print("Fetching price...")
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Failed with error \(error.localizedDescription)")
                //                    self.errorMessage = error.localizedDescription
                return
            }
            
            guard let httpResponse = response as?  HTTPURLResponse else {
                //                    self.errorMessage = "Bad HTTP Response"
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                //                    self.errorMessage = "Failed to fetch with status code \(httpResponse.statusCode)"
                return
            }
            
            print("DEBUG: Response code is \(httpResponse.statusCode)")
            guard let data = data else {return}
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {return}
            guard let value = jsonObject[coin] as? [String: Double] else {
                print("Failed to parse the value" )
                return}
            guard let price = value [currency] else {return}
            //                self.coin = coin.capitalized
            //                self.price = "\(price) \(currency)"
            print("DBUG: Price inside the service is \(price)")
            completions(price, coin)
        }.resume()
        
    }
}
