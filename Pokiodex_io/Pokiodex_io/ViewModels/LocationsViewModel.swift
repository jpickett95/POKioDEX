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
    
    // Filtered list of 'Locations' for searchbar
    var filteredItems: [Result] {
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
}
