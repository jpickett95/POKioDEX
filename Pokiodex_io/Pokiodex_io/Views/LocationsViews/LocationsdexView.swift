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
                ForEach(vm.locationsList){ location in
                    NavigationLink(destination: LocationDetailsView(vm: vm, location: location)) {
                        LocationCellView(vm: vm, location: location)
                    }//.onAppear{}
                }
            }
        }
        .searchable(text: $vm.searchText)
    }
}

struct LocationsdexView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsdexView()
    }
}
