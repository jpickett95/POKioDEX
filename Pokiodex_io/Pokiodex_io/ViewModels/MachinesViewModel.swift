//
//  MachinesViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import Foundation
import SwiftUI

final class MachinesViewModel: ObservableObject {
    private let moveManager = MoveManager()
    private let machineManager = MachineManager()
    @Published var searchText = ""
    @Published var machineElementList = [MachineElement]()
    @Published var machinesList = [MachineDetails]()
    @Published var moveDetails: MoveDetails?
    @Published var itemDetails: ItemDetails?
    
    // Filtered list of 'Machines for searchbar
    var filteredMoves: [MachineDetails] {
        return searchText == "" ? machinesList : machinesList.filter {
            $0.move.name.contains(searchText.lowercased()) || $0.item.name.contains(searchText.lowercased())
        }
    }
    
    // initializer to populate self.machinesList
    init() {
        DispatchQueue.global().async {
            self.machineManager.getMachines() { data in
                DispatchQueue.main.async {
                    self.machineElementList = data.results
                    //print(self.machinesList)
                    
                    self.getMachinesList()
                }
            }
        }
    }
    
    func getMachinesList() {
        DispatchQueue.global().async {
            for machine in self.machineElementList {
                self.machineManager.getMachineDetails(url: machine.url) { data in
                    DispatchQueue.main.async {
                        self.machinesList.append(data)
                        //print(self.machinesList)
                        //print(data)
                    }
                }
            }
        }
    }

    func getMoveDetails(url: String) {
        DispatchQueue.global().async {
            self.machineManager.getMoveDetails(url: url) { data in
                DispatchQueue.main.async {
                    self.moveDetails = data
                    //print(self.moveDetails)
                    //print(data)
                }
            }
        }
    }
    
    func getItemDetails(url: String) {
        DispatchQueue.global().async {
            self.machineManager.getItemDetails(url: url) { data in
                DispatchQueue.main.async {
                    self.itemDetails = data
                    //print(self.itemDetails)
                    //print(data)
                }
            }
        }
    }
    
    func parseID(url: String) -> String {
        var urlSrting = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        urlSrting = urlSrting.replacingOccurrences(of: "/", with: "")
        return urlSrting
    }
}
