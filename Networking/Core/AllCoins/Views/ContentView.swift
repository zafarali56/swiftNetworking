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
            Text("\(viewModel.coin) \(viewModel.price)")
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
