//
//  MoveDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/22/23.
//

import SwiftUI

struct MoveDetailsView: View {
    @ObservedObject var vm: MovesViewModel
    let move: Result
    
    var body: some View {
        ScrollView{
            VStack (spacing: 20){
                Text("\(move.name.capitalized.replacingOccurrences(of: "-", with: " "))").font(.title2).bold()
                
                TypeChips(vm: vm)
                
                Text("\(vm.moveDetails?.flavorTextEntries.first?.flavorText ?? "")")
                Text("**Target**: \(vm.moveDetails?.target.name.replacingOccurrences(of: "-", with: " ").capitalized ?? "")")
                
                MoveStatsSection(vm: vm)
                
                Text("Effect").font(.title2).bold()
                VStack(alignment: .leading, spacing: 15){
                    
                    Text("\(vm.moveDetails?.effectEntries?.first?.effect.replacingOccurrences(of: "$effect_chance%", with: "\(vm.moveDetails?.effectChance ?? 0)%") ?? "")")
                    if vm.moveDetails?.effectChance != nil {
                        Text("**Effect Chance**: \(vm.moveDetails?.effectChance ?? 0)%")
                    }
                    
                    let ailment = vm.moveDetails?.meta?.ailment?.name ?? "none"
                    let type = vm.moveDetails?.type.name.capitalized ?? "Normal"
                    if ailment != "none" {
                        HStack(spacing: 30){
                            Label{
                                Text("\(vm.moveDetails?.meta?.ailment?.name.capitalized ?? "")").bold()
                            } icon: {Image(systemName: vm.switchAilment(ailment: ailment)).foregroundColor(Color("Type_\(type)"))}
                            
                            
                            let ailmentChance = vm.moveDetails?.meta?.ailmentChance ?? 0
                            if ailmentChance == 0 {
                                Label{
                                    Text("**Chance**: 100%")
                                } icon: {Image(systemName: vm.switchAilment(ailment: ailment)).foregroundColor(Color("Type_\(type)"))}
                            } else {
                                Label{
                                    Text("**Chance**: \(ailmentChance)%")
                                } icon: {Image(systemName: vm.switchAilment(ailment: ailment)).foregroundColor(Color("Type_\(type)"))}
                            }
                        }
                    }
                }
            }
            .onAppear{vm.getDetails(move: move)}
            .padding(10)
        }
    }
}

struct TypeChips: View {
    @ObservedObject var vm: MovesViewModel
    
    var body: some View {
        HStack(spacing: 35){
            Label {
                Text(vm.moveDetails?.type.name.capitalized ?? "Normal")
            } icon:{
                Image("TypeIcon_\(vm.moveDetails?.type.name.capitalized ?? "Normal")")
                    .resizable()
                    .scaledToFit()
            }
            .font(.subheadline).bold()
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                RoundedRectangle( cornerRadius: 20)
                    .fill(Color("Type_\(vm.moveDetails?.type.name.capitalized ?? "Normal")").opacity(0.75))
            )
            .frame(height: 24)
            
            Label {
                Text(vm.moveDetails?.damageClass?.name.capitalized ?? "Special")
            } icon:{
                Image("\(vm.moveDetails?.damageClass?.name.capitalized ?? "Special")MoveIcon")
                    .resizable()
                    .scaledToFit()
            }
            .font(.subheadline).bold()
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                RoundedRectangle( cornerRadius: 20)
                    .fill(Color("MoveType_\(vm.moveDetails?.damageClass?.name.capitalized ?? "Special")").opacity(0.75))
            )
            .frame(height: 24)
        }
    }
}

struct MoveStatsSection: View{
    @ObservedObject var vm: MovesViewModel
    
    var body: some View{
        let type = vm.moveDetails?.type.name.capitalized ?? "Normal"

        // Stats Section
        Text("Stats")   // Title
            .font(.title2).bold()
        
        // Power
        HStack {
            HStack{
                Text("POW")
                Divider()
                    .frame(width: 1.5)
                    .overlay(Color("Type_\(type)"))
                Text("\(vm.moveDetails?.power ?? 0)")       // stat value
            }
            .frame(width: 100)
                    
            // Progress Bar
            ProgressView(value: Float(vm.moveDetails?.power ?? 0), total: Float(250))
                .accentColor(Color("Type_\(type)"))
                .scaleEffect(x: 1, y: 4, anchor: .center)
        }
        .padding([.leading, .trailing],30)
        
        // Accuracy
        HStack {
            HStack{
                Text("ACC")
                Divider()
                    .frame(width: 1.5)
                    .overlay(Color("Type_\(type)"))
                Text("\(vm.moveDetails?.accuracy ?? 0)")       // stat value
            }
            .frame(width: 100)
                
            // Progress Bar
            ProgressView(value: Float(vm.moveDetails?.accuracy ?? 0), total: Float(100))
                .accentColor(Color("Type_\(type)"))
                .scaleEffect(x: 1, y: 4, anchor: .center)
                
        }
        .padding([.leading, .trailing],30)
        
        // PP
        HStack {
            HStack{
                Text("PP")
                Divider()
                    .frame(width: 1.5)
                    .overlay(Color("Type_\(type)"))
                Text("\(vm.moveDetails?.pp ?? 0)")       // stat value
            }
            .frame(width: 100)
                
            // Progress Bar
            ProgressView(value: Float(vm.moveDetails?.pp ?? 0), total: Float(64))
                .accentColor(Color("Type_\(type)"))
                .scaleEffect(x: 1, y: 4, anchor: .center)
                
        }
        .padding([.leading, .trailing],30)
        
        // Priority
        HStack {
            let priority = vm.moveDetails?.priority ?? 0
            HStack{
                Text("PRIO")
                Divider()
                    .frame(width: 1.5)
                    .overlay(Color("Type_\(type)"))
                Text("\(priority)")       // stat value
            }
            .frame(width: 100)
                
            // Progress Bar
            if priority < 0 {
                ProgressView(value: Float(priority * -1), total: Float(5))
                    .accentColor(Color.red)
                    .scaleEffect(x: 1, y: 4, anchor: .center)
            } else {
                ProgressView(value: Float(priority), total: Float(5))
                    .accentColor(Color("Type_\(type)"))
                    .scaleEffect(x: 1, y: 4, anchor: .center)
            }
                
        }
        .padding([.leading, .trailing],30)
    }
}

struct MoveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MoveDetailsView(vm: MovesViewModel(), move: Result.sample)
    }
}
