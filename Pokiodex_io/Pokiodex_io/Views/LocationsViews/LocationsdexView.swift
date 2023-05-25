//
//  LocationsdexView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import SwiftUI

struct LocationsdexView: View {
    @StateObject var vm = LocationsViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(vm.filteredLocations){ location in
                    NavigationLink(destination: LocationDetailsView(vm: vm, location: location)) {
                        LocationCellView(vm: vm, location: location)
                    }.foregroundColor(Color.white)
                }
            }
        }
        .searchable(text: $vm.searchText)
        .navigationTitle("Locations")
    }
}

struct LocationsdexView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsdexView()
    }
}
