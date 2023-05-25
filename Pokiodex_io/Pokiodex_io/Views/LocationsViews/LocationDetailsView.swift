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
        ScrollView{
            VStack(spacing: 20){
                Text("\(location.name.replacingOccurrences(of: "-", with: " ").capitalized) Details").font(.title2).bold()
                
                Text("**Region**: \(vm.locationDetails?.region.name.replacingOccurrences(of: "-", with: " ").capitalized ?? "N/A")")

                // Areas within this Location
                Divider()
                Text("Areas").font(.title3).bold()
                let areas = vm.locationDetails?.areas ?? [URLObject]()
                ForEach(areas) { area in
                    let areaName = area.name.replacingOccurrences(of: "-", with: " ").capitalized
                    NavigationLink( areaName, destination: LocationAreaPokemonView(vm: vm, area: area))
                        .foregroundColor(Color.white)
                        .padding(15)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue.opacity(0.5)))
                        
                }
            }.padding(20)
        }.onAppear{vm.getDetails(url: location.url)}
            .navigationTitle(location.name.replacingOccurrences(of: "-", with: " ").capitalized)
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(vm: LocationsViewModel(), location: Result.sample)
    }
}
