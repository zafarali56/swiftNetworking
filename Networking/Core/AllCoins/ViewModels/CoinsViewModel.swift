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
    @Published var errorMessage: String?
     
    private let service = CoinDataClass()
    init() {
            fetchPrice(price: "pkr", coin: "bitcoin" )    }
    
    func fetchPrice(price: String, coin: String){
        service.fetchPrice(coin: coin, currency: price ){ priceFromService, coinFromservice in
            DispatchQueue.main.async {
                self.coin = coin
                self.price = ("\(priceFromService) Currency: \(price)")
            }
        }
    }
}
