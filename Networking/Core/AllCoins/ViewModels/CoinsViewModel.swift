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
        fetchPrice()
    }
    
    func fetchPrice() {
        self.coin = "Bitcoin"
        self.price = "30,000"
    }
}
