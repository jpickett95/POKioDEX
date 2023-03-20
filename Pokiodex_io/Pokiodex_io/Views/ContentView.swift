//
//  ContentView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PokemonViewModel()

    var body: some View {
        NavigationStack {
            NavigationLink(destination: PokedexView()) {
                Image("PokedexImage")
                    .resizable()
                    .scaledToFit()
            }
            Text("Hello, world!")
        }
        .padding()
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
