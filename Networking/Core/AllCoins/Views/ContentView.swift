//
//  ContentView.swift
//  Networking
//
//  Created by Zafar Ali on 29/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage{
               Text (errorMessage)
            } else {
                Text("\(viewModel.coin) \(viewModel.price)")
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
