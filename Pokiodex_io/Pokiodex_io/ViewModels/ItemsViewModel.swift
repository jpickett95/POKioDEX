//
//  ItemsViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation

final class ItemsViewModel: ObservableObject {
    private let manager = ItemsManager()
    @Published var searchText = ""
    @Published var itemsList = [Result]()
    
    // Filtered list of 'Items' for searchbar
    var filteredItems: [Result] {
        return searchText == "" ? itemsList : itemsList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    // initializer to populate self.itemsList
    init() {
        DispatchQueue.global().async {
            self.manager.getItems() { data in
                DispatchQueue.main.async {
                    self.itemsList = data.results
                    //print(self.itemsList)
                }
            }
        }
    }
    
}
