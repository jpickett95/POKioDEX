//
//  TypeMatchupsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import SwiftUI

struct TypeMatchupsView: View {
    @State private var type1 = "None"
    @State private var type2 = "None"
    //@State var selectedTypes: [String]?
    //@State private var popup1_IsOpen = false
    @State private var type1Icon = "TypeIcon_"
    let types = ["Normal", "Fire", "Water", "Grass", "Electric", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dark", "Dragon", "Steel", "Fairy", "None"]
    @StateObject var vm = TypeMatchupViewModel()
    
    var body: some View {
        ScrollView{
            VStack(){
                Text("Select Type(s):").font(.title).bold()
                    .padding(20)
                
                VStack(spacing: 20) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("Type_\(type1)"))
                            .frame(width: 175, height: 40)
                        
                        HStack{
                            Picker("Select a type", selection: $type1) {
                                ForEach(types, id: \.self) { type in
                                    Text(type)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .tint(Color.white)
                            .onChange(of: type1) { newValue in
                                //vm.emptyStringArrays()
                                if type1 != "None" && type2 != "None" {
                                    vm.returnDamageRelations(types: [type1, type2])
                                } else if type1 != "None" && type2 == "None" {
                                    vm.returnDamageRelations(types: [type1])
                                }else if type2 != "None" && type1 == "None" {
                                    vm.returnDamageRelations(types: [type2])
                                }
                            }
                            
                            
                            if type1 != "None"{
                                Image("TypeIcon_\(type1)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                            }
                        }
//                        }.onChange(of: type1) { newValue in
//                            //vm.emptyStringArrays()
//                            if type1 != "None" && type2 != "None" {
//                                vm.returnDamageRelations(types: [type1, type2])
//                            } else if type1 != "None" && type2 == "None" {
//                                vm.returnDamageRelations(types: [type1])
//                            }else if type2 != "None" && type1 == "None" {
//                                vm.returnDamageRelations(types: [type2])
//                            }
//                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("Type_\(type2)"))
                            .frame(width: 175, height: 40)
                        
                        HStack{
                            Picker("Select a type", selection: $type2) {
                                ForEach(types, id: \.self) { type in
                                    Text(type)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .tint(Color.white)
//                            .onChange(of: type2){ newValue in
//                                if type1 != "None" && type2 != "None" {
//                                    vm.returnDamageRelations(types: [type1, type2])
//                                } else if type1 != "None" && type2 == "None" {
//                                    vm.returnDamageRelations(types: [type1])
//                                }else if type2 != "None" && type1 == "None" {
//                                    vm.returnDamageRelations(types: [type2])
//                                }
//                            }
                            
                            if type2 != "None"{
                                Image("TypeIcon_\(type2)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                            }
                        }.onChange(of: type2) { newValue in
                            //vm.emptyStringArrays()
                            if type1 != "None" && type2 != "None" {
                                vm.returnDamageRelations(types: [type1, type2])
                            } else if type1 != "None" && type2 == "None" {
                                vm.returnDamageRelations(types: [type1])
                            }else if type2 != "None" && type1 == "None" {
                                vm.returnDamageRelations(types: [type2])
                            }
                        }
                    }
                }
                
                Text("Selected color: \(type1)")
                
                
                Group{
                    // Resistances Section
                    let doubleDamage = vm.doubleDamageFrom
                    let halfDamage = vm.halfDamageFrom
                    let noDamage = vm.noDamageFrom
                    let quadDamage = vm.quadDamageFrom
                    let quarterDamage = vm.quarterDamageFrom
                    
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
                                    //.overlay(Color("Type_\(type)"))
                                
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
                                    //.overlay(Color("Type_\(type)"))
                                
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
                                    //.overlay(Color("Type_\(type)"))
                                
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
                                    //.overlay(Color("Type_\(type)"))
                                
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
                                    //.overlay(Color("Type_\(type)"))
                                
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
            
        }//.onAppear{vm.returnDamageRelations(types: [String]())}
    }
}



struct TypeMatchupsView_Previews: PreviewProvider {
    static var previews: some View {
        TypeMatchupsView()
    }
}
