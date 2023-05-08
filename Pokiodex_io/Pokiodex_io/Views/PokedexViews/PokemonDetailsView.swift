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
                    
                    // Official Artwork Image
                    AsyncImage(url: URL(string: vm.pokemonDetails?.sprites.other?.official_artwork.front_default ?? OfficialArtwork.sample.front_default), scale: 2)
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
                            Text("\(vm.pokemonDetails?.abilities.first?.ability.name.capitalized ?? "Overgrow")")
                                .font(.headline)
                                .foregroundColor(Color("Type_\(type)"))
                        } icon: {
                            Image(systemName: "sparkles").foregroundColor(Color("Type_\(type)"))
                                
                        }
                        Text("Abilities")
                            .font(.caption)
                    }
                    
                }.scaledToFit()
                
                // Description
                var flavorText = vm.formatFlavorText(string: (vm.pokemonSpecies?.flavor_text_entries.first?.flavor_text ?? "N/A"))
                Text(flavorText)
                    .padding([.leading, .trailing], 5)
                
                // Stats Section
                Text("Stats")   // Title
                    .font(.title2).bold()
                
                // Progress Bar created for each stat
                ForEach(vm.pokemonDetails?.stats ?? [PokemonStats]()) { stat in
                    HStack {
                        HStack{
                            Text(vm.switchStatName(stat: stat.stat.name)).bold()    // stat name
                            Divider()
                                .frame(width: 1.5)
                                .overlay(Color("Type_\(type)"))
                            Text("\(stat.base_stat)")       // stat value
                        }
                        .frame(width: 100)
                            
                        // Progress Bar
                        ProgressView(value: Float(stat.base_stat), total: Float(255))
                            .accentColor(Color("Type_\(type)"))
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            
                    }
                    .padding([.leading, .trailing],30)
                }
                
                // Characteristics Section
                Text("Characteristics")   // Title
                    .font(.title2).bold()
                
                VStack(alignment: .leading, spacing: 10) {
                    // Gender Rate
                    let genderRate = vm.pokemonSpecies?.gender_rate ?? 0
                    if genderRate == -1 {
                        Label {
                            Text("This pokemon is genderless")
                        } icon: {
                            Image(systemName: "figure.dress.line.vertical.figure").foregroundColor(Color("Type_\(type)"))
                        }
                    } else {
                        let female = vm.formatGenderRate(value: genderRate).female
                        let male = vm.formatGenderRate(value: genderRate).male
                        Label {
                            Text("\(female)% Female | \(male)% Male")
                        } icon: {
                            Image(systemName: "figure.dress.line.vertical.figure").foregroundColor(Color("Type_\(type)"))
                        }
                    }
                    
                    // Capture Rate
                    Label {
                        Text("Capture Rate: \(vm.pokemonSpecies?.capture_rate ?? 0)")
                    } icon: {
                        Image(systemName: "circle.circle.fill").foregroundColor(Color("Type_\(type)"))
                    }
                    
                    // Base Happiness
                    Label {
                        Text("Base Happiness: \(vm.pokemonSpecies?.base_happiness ?? 0)")
                    } icon: {
                        Image(systemName: "face.smiling.fill").foregroundColor(Color("Type_\(type)"))
                    }
                    
                    // Hatch Counter
                    Label {
                        Text("Hatch Counter: \(vm.pokemonSpecies?.hatch_counter ?? 0)")
                    } icon: {
                        Image(systemName: "figure.walk.motion").foregroundColor(Color("Type_\(type)"))
                    }
                    
                    // Is Baby Pokemon
                    if vm.pokemonSpecies?.is_baby == true {
                        Label {
                            Text("This is a baby pokemon")
                        } icon: {
                            Image(systemName: "stroller.fill").foregroundColor(Color("Type_\(type)"))
                        }
                    }
                    
                    // Is Legendary Pokemon
                    if vm.pokemonSpecies?.is_legendary == true {
                        Label {
                            Text("This is a legendary pokemon")
                        } icon: {
                            Image(systemName: "crown.fill").foregroundColor(Color("Type_\(type)"))
                        }
                    }
                    
                    // Is Mythical Pokemon
                    if vm.pokemonSpecies?.is_mythical == true {
                        Label {
                            Text("This is a mythical pokemon")
                        } icon: {
                            Image(systemName: "wand.and.stars").foregroundColor(Color("Type_\(type)"))
                        }
                    }
                }
                
            }
            .onAppear{vm.getDetails(pokemon: pokemon)}
            .navigationTitle("\(pokemon.name.capitalized)")
        }
        
//        TabView {
//            PokemonDetailsView(vm: vm, pokemon: pokemon)
//                .tabItem() {
//                    Image(systemName: "person.text.rectangle.fill")
//                    Text("Details")
//                }
//        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
            
    }
}
