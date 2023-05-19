//
//  PokemonDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Result
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                //let type = vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal"
                //let typeCount = (vm.pokemonDetails?.types.count) ?? 1
                
                ImageView(vm: vm)
                
                AboutSection(vm: vm)
                
                // Description
                let flavorText = vm.formatFlavorText(string: (vm.pokemonSpecies?.flavorTextEntries.first?.flavorText ?? "N/A"))
                Text(flavorText)
                    .padding([.leading, .trailing], 5)
                
                StatsSection(vm: vm)
                
                CharacteristicsView(vm: vm)
                
                ResistancesView(vm: vm)
            }
            .onAppear{
                vm.getDetails(pokemon: pokemon)
            }
            .navigationTitle("\(pokemon.name.capitalized)")
        }
        
    }
}

struct CharacteristicsView: View {
    @ObservedObject var vm: PokemonViewModel
    
    var body: some View{
        let type = vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal"
        // Characteristics Section
        Text("Characteristics")   // Title
            .font(.title2)
            .bold()
        
        
            VStack(alignment: .leading, spacing: 10) {
                Group{
                    // Gender Rate
                    let genderRate = vm.pokemonSpecies?.genderRate ?? 0
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
                    
                    // Has Gender Differences
                    if vm.pokemonSpecies?.hasGenderDifferences == true {
                        Label {
                            Text("This pokemon has gender differences")
                        } icon: {
                            Image(systemName: "figure.dress.line.vertical.figure").foregroundColor(Color("Type_\(type)"))
                        }
                    }
                    
                    // Capture Rate
                    Label {
                        Text("Capture Rate: \(vm.pokemonSpecies?.captureRate ?? 0)")
                    } icon: {
                        Image(systemName: "circle.circle.fill").foregroundColor(Color("Type_\(type)"))
                    }
                    
                    // Base Happiness
                    Label {
                        Text("Base Happiness: \(vm.pokemonSpecies?.baseHappiness ?? 0)")
                    } icon: {
                        Image(systemName: "face.smiling.fill").foregroundColor(Color("Type_\(type)"))
                    }
                    
                    // Hatch Counter
                    Label {
                        Text("Hatch Counter: \(vm.pokemonSpecies?.hatchCounter ?? 0)")
                    } icon: {
                        Image(systemName: "figure.walk.motion").foregroundColor(Color("Type_\(type)"))
                    }
                }
                
                Group{
                    // Egg Groups
                    Label {
                        Text("Egg Groups:")
                        ForEach(vm.pokemonSpecies?.eggGroups ?? [URLObject]()) { eggGroup in
                            Text(eggGroup.name.capitalized)
                        }
                    } icon: {
                        Image(systemName: "stroller.fill").foregroundColor(Color("Type_\(type)"))
                    }
                    
                    // Genus Groups
                    Label {
                        Text("Genus:")
                        let genera = vm.pokemonSpecies?.genera ?? [Genus]()
                        ForEach(genera) { genus in
                            if genus.language.name == "en"{
                                Text(genus.genus.capitalized)
                            }
                        }
                    } icon: {
                        Image(systemName: "tree.fill").foregroundColor(Color("Type_\(type)"))
                    }
                    
                    // Growth Rate
                    Label {
                        Text("Growth Rate: \(vm.pokemonSpecies?.growthRate.name.replacingOccurrences(of: "-", with: " ").capitalized ?? "")")
                    } icon: {
                        Image(systemName: "leaf.fill").foregroundColor(Color("Type_\(type)"))
                    }
                }
                
               OptionalCharacteristicsView(vm: vm)
            }
    }
}

struct OptionalCharacteristicsView: View {
    @ObservedObject var vm: PokemonViewModel

    var body: some View {
        let type = vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal"

        // Is Baby Pokemon
        if vm.pokemonSpecies?.isBaby == true {
            Label {
                Text("This is a baby pokemon")
            } icon: {
                Image(systemName: "stroller.fill").foregroundColor(Color("Type_\(type)"))
            }
        }
        
        // Is Legendary Pokemon
        if vm.pokemonSpecies?.isLegendary == true {
            Label {
                Text("This is a legendary pokemon")
            } icon: {
                Image(systemName: "crown.fill").foregroundColor(Color("Type_\(type)"))
            }
        }
        
        // Is Mythical Pokemon
        if vm.pokemonSpecies?.isMythical == true {
            Label {
                Text("This is a mythical pokemon")
            } icon: {
                Image(systemName: "wand.and.stars").foregroundColor(Color("Type_\(type)"))
            }
        }
        
        // Has Switchable Forms
        if vm.pokemonSpecies?.formsSwitchable == true {
            Label {
                Text("This pokemon has switchable forms")
            } icon: {
                Image(systemName: "figure.stand.line.dotted.figure.stand").foregroundColor(Color("Type_\(type)"))
            }
        }
    }
}

struct ResistancesView: View {
    @ObservedObject var vm: PokemonViewModel
    //let pokemon: Result
    
    var body: some View{
        let type = vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal"

        Group{
            // Resistances Section
            let doubleDamage = vm.returnDamageRelations().damageDoubleFrom
            let halfDamage = vm.returnDamageRelations().damageHalfFrom
            let noDamage = vm.returnDamageRelations().noDamageFrom
            let quadDamage = vm.returnDamageRelations().damageQuadFrom
            let quarterDamage = vm.returnDamageRelations().damageQuarterFrom
            
            // Weaknesses Section
            Text("Weaknesses")      // Title
                .font(.title2)
                .bold()

            VStack(alignment: .leading) {
                
                // Quadruple Damage
                if !quadDamage.isEmpty {
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.red)
                            Text("x4")
                                .bold()
                                .foregroundColor(Color.white)
                                .scaledToFit()
                            
                        }.frame(width: 30, height: 25)
                        
                        Divider()
                            .frame(width: 1.5)
                            .overlay(Color("Type_\(type)"))
                        
                        ForEach(quadDamage) { type in
                            Label {
                                
                            } icon:{
                                Image("TypeIcon_\(type.capitalized)")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(
                                Circle()
                                    .fill(Color("Type_\(type.capitalized)").opacity(0.75))
                            )
                            .frame(height: 25)
                        }
                    }
                }
                
                // Double Damage
                if !doubleDamage.isEmpty {
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.orange)
                            Text("x2")
                                .bold()
                                .foregroundColor(Color.white)
                                .scaledToFit()
                            
                        }.frame(width: 30, height: 25)
                        
                        Divider()
                            .frame(width: 1.5)
                            .overlay(Color("Type_\(type)"))
                        
                        ForEach(doubleDamage) { type in
                            Label {
                                
                            } icon:{
                                Image("TypeIcon_\(type.capitalized)")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(
                                Circle()
                                    .fill(Color("Type_\(type.capitalized)").opacity(0.75))
                            )
                            .frame(height: 25)
                        }
                    }
                }
            }
            
            // Resistances Section
            Text("Resistances")     // Title
                .font(.title2)
                .bold()
            VStack(alignment: .leading) {
                
                // 1/2 Damage
                if !halfDamage.isEmpty {
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.yellow)
                            Text("x\u{00BD}")
                                .bold()
                                .foregroundColor(Color.white)
                                .scaledToFit()
                            
                        }.frame(width: 30, height: 25)
                        
                        Divider()
                            .frame(width: 1.5)
                            .overlay(Color("Type_\(type)"))
                        
                        ForEach(halfDamage) { type in
                            Label {
                                
                            } icon:{
                                Image("TypeIcon_\(type.capitalized)")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(
                                Circle()
                                    .fill(Color("Type_\(type.capitalized)").opacity(0.75))
                            )
                            .frame(height: 25)
                        }
                    }
                }
                
                // 1/4 Damage
                if !quarterDamage.isEmpty {
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.green)
                            Text("x\u{00BC}")
                                .bold()
                                .foregroundColor(Color.white)
                                .scaledToFit()
                            
                        }.frame(width: 30, height: 25)
                        
                        Divider()
                            .frame(width: 1.5)
                            .overlay(Color("Type_\(type)"))
                        
                        ForEach(quarterDamage) { type in
                            Label {
                                
                            } icon:{
                                Image("TypeIcon_\(type.capitalized)")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(
                                Circle()
                                    .fill(Color("Type_\(type.capitalized)").opacity(0.75))
                            )
                            .frame(height: 25)
                        }
                    }
                }
                
                // 0 Damage
                if !noDamage.isEmpty {
                    HStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue)
                            Text("x0")
                                .bold()
                                .foregroundColor(Color.white)
                                .scaledToFit()
                            
                        }.frame(width: 30, height: 25)
                        
                        Divider()
                            .frame(width: 1.5)
                            .overlay(Color("Type_\(type)"))
                        
                        ForEach(noDamage) { type in
                            Label {
                                
                            } icon:{
                                Image("TypeIcon_\(type.capitalized)")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(
                                Circle()
                                    .fill(Color("Type_\(type.capitalized)").opacity(0.75))
                            )
                            .frame(height: 25)
                        }
                    }
                }
            }
        
        }
    }
}

struct ImageView: View{
    @ObservedObject var vm: PokemonViewModel
    
    var body: some View{
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
            AsyncImage(url: URL(string: vm.pokemonDetails?.sprites.other?.officialArtwork.frontDefault ?? OfficialArtwork.sample.frontDefault), scale: 2)
        }
    }
}

struct AboutSection: View {
    @ObservedObject var vm: PokemonViewModel

    var body: some View{
        let type = vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal"
        let typeCount = (vm.pokemonDetails?.types.count) ?? 1
        Group {
            
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
                    let abilities = vm.pokemonDetails?.abilities ?? [Ability]()
                    ForEach(abilities) { ability in
                        Label {
                            Text("\(ability.ability.name.replacingOccurrences(of: "-", with: " ").capitalized)")
                                .font(.headline)
                                .foregroundColor(Color("Type_\(type)"))
                        } icon: {
                            if ability.isHidden == true {
                                Image(systemName: "eye.fill").foregroundColor(Color("Type_\(type)"))
                            }else {
                                Image(systemName: "sparkles").foregroundColor(Color("Type_\(type)"))
                            }
                        }
                    }
                    Text("Abilities")
                        .font(.caption)
                }
                
            }.scaledToFit()
        }
    }
}

struct StatsSection: View{
    @ObservedObject var vm: PokemonViewModel
    
    var body: some View{
        let type = vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal"

        // Stats Section
        Text("Stats")   // Title
            .font(.title2).bold()
        
        // Progress Bar created for each stat
        let stats = vm.pokemonDetails?.stats ?? [Stat]()
        ForEach(stats) { stat in
            HStack {
                HStack{
                    Text("\(vm.switchStatName(stat: stat.stat.name))")
                    Divider()
                        .frame(width: 1.5)
                        .overlay(Color("Type_\(type)"))
                    Text("\(stat.baseStat)")       // stat value
                }
                .frame(width: 100)
                    
                // Progress Bar
                ProgressView(value: Float(stat.baseStat), total: Float(255))
                    .accentColor(Color("Type_\(type)"))
                    .scaleEffect(x: 1, y: 4, anchor: .center)
                    
            }
            .padding([.leading, .trailing],30)
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(vm: PokemonViewModel(), pokemon: Result.sample)
            
    }
}
