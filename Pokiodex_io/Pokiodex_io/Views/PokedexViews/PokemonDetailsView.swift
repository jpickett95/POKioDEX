//
//  PokemonDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                let type = vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal"
                let typeCount = (vm.pokemonDetails?.types.count) ?? 1
                
                // Pokemon Image
                ZStack{
                    if(typeCount > 1) {
                        let type2 = vm.pokemonDetails?.types.last?.type.name.capitalized ?? "Normal"
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("Type_\(type)").opacity(0.75), Color("Type_\(type2)").opacity(0.75)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame( height: 300)
                            .overlay(alignment: .topLeading) {
                                Text("#\(vm.pokemonDetails?.id ?? 0)")
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .padding()
                            }
                            .overlay(alignment: .bottomTrailing){
                                Image(systemName: "circle.circle.fill")
                                    .font(.system(size: 250))
                                    .opacity(0.15)
                            }
                            .ignoresSafeArea()
                    } else {
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("Type_\(type)"), Color.white.opacity(0.75)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame( height: 300)
                            .overlay(alignment: .topLeading) {
                                Text("#\(vm.pokemonDetails?.id ?? 0)")
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .padding()
                            }
                            .overlay(alignment: .bottomTrailing){
                                Image(systemName: "circle.circle.fill")
                                    .font(.system(size: 250))
                                    .opacity(0.15)
                            }
                            .ignoresSafeArea()
                    }
                    PokemonImageView(vm:vm, pokemon: pokemon, dimensions: 140)
                }
                
                
                
                // Types
                HStack{
                    
                    // Type 1 Label
                    Label {
                        Text(type)
                    } icon:{
                        Image("TypeIcon_\(type)")
                            .resizable()
                            .scaledToFit()
                    }
                    .font(.subheadline).bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle( cornerRadius: 20)
                            .fill(Color("Type_\(type)").opacity(0.75))
                    )
                    .frame(height: 24)
                    
                    // Type 2 Check & Label
                    //let typeCount = (vm.pokemonDetails?.types.count) ?? 1
                    if(typeCount > 1){
                        let type2 = vm.pokemonDetails?.types.last?.type.name.capitalized ?? "Normal"
                        Label {
                            Text(type2)
                        } icon:{
                            Image("TypeIcon_\(type2)")
                                .resizable()
                                .scaledToFit()
                        }
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle( cornerRadius: 20)
                                .fill(Color("Type_\(type2)").opacity(0.75))
                        )
                        .frame(height: 24)
                    }
                }
                
                // About Section
                Text("About")   // Title
                    .font(.title2).bold()
                HStack{
                    // Weight
                    VStack(spacing: 10){
                        Label {
                            Text("\(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) kg")
                                .font(.headline)
                        } icon: {
                            Image(systemName: "scalemass.fill").foregroundColor(Color("Type_\(type)"))
                                
                        }
                        Text("Weight")
                            .font(.caption)
                    }
                    Divider()
                    
                    // Height
                    VStack(spacing: 10){
                        Label {
                            Text("\(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) m")
                                .font(.headline)
                        } icon: {
                            Image(systemName: "ruler.fill")
                                .foregroundColor(Color("Type_\(type)"))
                                .rotationEffect(.degrees(-90))
                                
                        }
                        Text("Height")
                            .font(.caption)
                    }
                    Divider()
                    
                    // Abilities
                    VStack(spacing: 10){
                        Label {
                            Text("Overgrow")
                                .font(.headline)
                                .foregroundColor(Color("Type_\(type)"))
                        } icon: {
                            Image(systemName: "sparkles").foregroundColor(Color("Type_\(type)"))
                                
                        }
                        Text("Abilities")
                            .font(.caption)
                    }
                    
                }.scaledToFit()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("**Name**: \(pokemon.name.capitalized)")
                    Text("**No**: \(vm.pokemonDetails?.id ?? 0)")
                    Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) m")
                    Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) kg")
                }
                
            }
            .onAppear{vm.getDetails(pokemon: pokemon)}
            .navigationTitle("\(pokemon.name.capitalized)'s Details")
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
            
    }
}
