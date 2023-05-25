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
            ScrollView {
                // Pokedex Feature
                NavigationLink(destination: PokedexView()) {
                    Image("PokedexImage")
                        .resizable()
                        .scaledToFit()
                }
                
                // Moves & TMs Feature
                HStack{
                    NavigationLink(destination: MovesdexView()) {
                        Image("MovesImage")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    NavigationLink(destination: TMsdexView()) {
                        Image("TMsImage")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .padding(5)
                
                // Pokemon Abilities Feature
                NavigationLink(destination: AbilitiesdexView()) {
                    ZStack{
                        HStack{
                            Image(systemName: "sparkles")
                                .resizable()
                                .scaledToFit()
                                .accentColor(Color.white)
                                .padding(15)
                            
                            Spacer()
                            
                            Text("Abilities")
                                .font(.title).bold()
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 30)
                    }
                    .frame(width: 350, height: 75)
                    .background(Color.purple.opacity(0.9))
                    .cornerRadius(15)
                }
                
                // Type Matchups Feature
                NavigationLink(destination: TypeMatchupsView()) {
                    ZStack{
                        HStack{
                            Image(systemName: "checkerboard.shield")
                                .resizable()
                                .scaledToFit()
                                .accentColor(Color.white)
                                .padding(15)
                            
                            Spacer()
                            
                            Text("Type Matchups")
                                .font(.title).bold()
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 30)
                    }
                    .frame(width: 350, height: 75)
                    .background(Color.gray.opacity(0.9))
                    .cornerRadius(15)
                }
                
                // Pokemon Natures Feature
                NavigationLink(destination: NaturesdexView()) {
                    ZStack{
                        HStack{
                            Image(systemName: "leaf")
                                .resizable()
                                .scaledToFit()
                                .accentColor(Color.white)
                                .padding(15)
                            
                            Spacer()
                            
                            Text("Natures")
                                .font(.title).bold()
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 30)
                    }
                    .frame(width: 350, height: 75)
                    .background(Color.green.opacity(0.9))
                    .cornerRadius(15)
                }
                
                // Game Objects Feature
                NavigationLink(destination: ObjectsdexView()) {
                    ZStack{
                        HStack{
                            Image(systemName: "backpack")
                                .resizable()
                                .scaledToFit()
                                .accentColor(Color.white)
                                .padding(15)
                            
                            Spacer()
                            
                            Text("Game Objects")
                                .font(.title).bold()
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 30)
                    }
                    .frame(width: 350, height: 75)
                    .background(Color.brown.opacity(0.9))
                    .cornerRadius(15)
                }
                
                // Locations Feature
                NavigationLink(destination: LocationsdexView()) {
                    ZStack{
                        HStack{
                            Image(systemName: "map")
                                .resizable()
                                .scaledToFit()
                                .accentColor(Color.white)
                                .padding(15)
                            
                            Spacer()
                            
                            Text("Locations")
                                .font(.title).bold()
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 30)
                    }
                    .frame(width: 350, height: 75)
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(15)
                }
            }
            .padding()
            .environmentObject(vm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
