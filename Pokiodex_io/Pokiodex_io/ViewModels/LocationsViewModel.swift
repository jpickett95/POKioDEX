//
//  LocationsViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation

final class LocationsViewModel: ObservableObject {
    private let manager = LocationsManager()
    @Published var searchText = ""
    @Published var locationsList = [Result]()
    @Published var locationDetails: LocationDetails?
    @Published var areaDetails: LocationArea?
    
    // Filtered list of 'Locations' for searchbar
    var filteredLocations: [Result] {
        return searchText == "" ? locationsList : locationsList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    // initializer to populate self.locationsList
    init() {
        DispatchQueue.global().async {
            self.manager.getLocations() { data in
                DispatchQueue.main.async {
                    self.locationsList = data.results
                    //print(self.locationsList)
                }
            }
        }
    }
    
    // Gets Location details from API
    func getDetails(url: String) {
        DispatchQueue.global().async {
            self.manager.getDetails(url: url) { data in
                DispatchQueue.main.async {
                    self.locationDetails = data
                    //print(self.locationDetails)
                    //print(data)
                }
            }
        }
    }
    
    // Gets Area details from API
    func getAreaDetails(url: String) {
        DispatchQueue.global().async {
            self.manager.getAreaDetails(url: url) { data in
                DispatchQueue.main.async {
                    self.areaDetails = data
                    //print(self.areaDetails)
                    //print(data)
                }
            }
        }
    }
    
    // Parses Pokemon id# from 'Pokemon' url
    func parseID(url: String) -> String {
        var urlSrting = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        urlSrting = urlSrting.replacingOccurrences(of: "/", with: "")
        return urlSrting
    }
}
