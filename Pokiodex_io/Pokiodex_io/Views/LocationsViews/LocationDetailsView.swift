//
//  LocationDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import SwiftUI

struct LocationDetailsView: View {
    @ObservedObject var vm: LocationsViewModel
    let location: Result
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(vm: LocationsViewModel(), location: Result.sample)
    }
}
