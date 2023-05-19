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
    @Published var itemDetails: ItemDetails?
    
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
    
    func getDetails(url: String) {
        DispatchQueue.global().async {
            self.manager.getDetails(url: url) { data in
                DispatchQueue.main.async {
                    self.itemDetails = data
                    //print(self.itemDetails)
                    //print(data)
                }
            }
        }
    }
    
    func filterFlavorTextLanguage(language: String) -> String {
        var textStrings = [String]()
        let flavorTexts = self.itemDetails?.flavorTextEntries ?? [VersionGroupFlavorText]()
        
        for flavorText in flavorTexts {
            if flavorText.language.name == language {
                textStrings.append(flavorText.text)
            }
        }
        
        return textStrings.last ?? "N/A"
    }
}
