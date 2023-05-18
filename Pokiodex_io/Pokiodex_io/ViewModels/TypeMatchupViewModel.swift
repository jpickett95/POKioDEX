//
//  TypeMatchupViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/16/23.
//

import Foundation
import SwiftUI

final class TypeMatchupViewModel: ObservableObject {
    @Published var pokemonTypes = [TypeDetails]()
    @Published var doubleDamageFrom = [String]()
    @Published var doubleDamageTo = [String]()
    @Published var halfDamageFrom = [String]()
    @Published var halfDamageTo = [String]()
    @Published var noDamageFrom = [String]()
    @Published var noDamageTo = [String]()
    @Published var quadDamageFrom = [String]()
    @Published var quadDamageTo = [String]()
    @Published var quarterDamageFrom = [String]()
    @Published var quarterDamageTo = [String]()
    
    private var manager = TypeMatchupsManager()
    
    func getTypeDetails(type: String) {
        DispatchQueue.global().async {
            self.manager.getTypeDetails(typeName: type) { data in
                DispatchQueue.main.async {
                    self.pokemonTypes.append(data)
                    //print(data)
                    //print(self.pokemonTypes)
                }
            }
        }
    }
    
    func emptyStringArrays() {
        self.pokemonTypes.removeAll()
        self.doubleDamageTo.removeAll()
        self.doubleDamageFrom.removeAll()
        self.halfDamageTo.removeAll()
        self.halfDamageFrom.removeAll()
        self.noDamageTo.removeAll()
        self.noDamageFrom.removeAll()
        self.quadDamageTo.removeAll()
        self.quadDamageFrom.removeAll()
        self.quarterDamageTo.removeAll()
        self.quarterDamageFrom.removeAll()
    }
    
    func returnDamageRelations(types: [String]) {
        //emptyStringArrays()
        
        for type in types {
            self.getTypeDetails(type: type)
        }
        //print(self.pokemonTypes)
        
        for type in self.pokemonTypes {
            for typeName in type.damageRelations.doubleDamageFrom {
                if(self.doubleDamageFrom.contains(typeName.name)) {
                    if let index = self.doubleDamageFrom.firstIndex(of: typeName.name){
                        self.doubleDamageFrom.remove(at: index)
                    }
                    self.quadDamageFrom.append(typeName.name)
                }else {
                    self.doubleDamageFrom.append(typeName.name)
                }
                if(self.halfDamageFrom.contains(typeName.name)) {
                    if let index = self.halfDamageFrom.firstIndex(of: typeName.name){
                        self.halfDamageFrom.remove(at: index)
                    }
                    if let index = self.doubleDamageFrom.firstIndex(of: typeName.name){
                        self.doubleDamageFrom.remove(at: index)
                    }
                }
                if(self.noDamageFrom.contains(typeName.name)) {
                    if let index = self.doubleDamageFrom.firstIndex(of: typeName.name){
                        self.doubleDamageFrom.remove(at: index)
                    }
                }
            }
            for typeName in type.damageRelations.halfDamageFrom {
                if(self.halfDamageFrom.contains(typeName.name)) {
                    if let index = self.halfDamageFrom.firstIndex(of: typeName.name){
                        self.halfDamageFrom.remove(at: index)
                    }
                    self.quarterDamageFrom.append(typeName.name)
                }else {
                    self.halfDamageFrom.append(typeName.name)
                }
                if(self.doubleDamageFrom.contains(typeName.name)) {
                    if let index = self.halfDamageFrom.firstIndex(of: typeName.name){
                        self.halfDamageFrom.remove(at: index)
                    }
                    if let index = self.doubleDamageFrom.firstIndex(of: typeName.name){
                        self.doubleDamageFrom.remove(at: index)
                    }
                }
                if(self.noDamageFrom.contains(typeName.name)) {
                    if let index = self.halfDamageFrom.firstIndex(of: typeName.name){
                        self.halfDamageFrom.remove(at: index)
                    }
                }
            }
            for typeName in type.damageRelations.noDamageFrom {
                if(!self.noDamageFrom.contains(typeName.name)) {
                    self.noDamageFrom.append(typeName.name)
                }
                if(self.doubleDamageFrom.contains(typeName.name)) {
                    if let index = self.doubleDamageFrom.firstIndex(of: typeName.name){
                        self.doubleDamageFrom.remove(at: index)
                    }
                }
                if(self.halfDamageFrom.contains(typeName.name)) {
                    if let index = self.halfDamageFrom.firstIndex(of: typeName.name){
                        self.halfDamageFrom.remove(at: index)
                    }
                }
            }
        }
        
        print(self.doubleDamageFrom.first)
        print(self.halfDamageFrom.first)
        print(self.quarterDamageFrom.first)
        print(self.quadDamageFrom.first)
        print(self.noDamageFrom.first)
    }
}
