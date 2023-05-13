//
//  TMsdexTabView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import SwiftUI

struct TMsdexTabView: View {
    @ObservedObject var vm: MachinesViewModel
    let machine: MachineDetails
    
    var body: some View {
        TabView{
            MachineDetailsView()
                .tabItem {
                    Label {
                        Text("Details")
                    } icon: {
                        Image(systemName: "person.text.rectangle.fill")
                    }
                }
            
            MachineLearnedByView()
                .tabItem {
                    Label {
                        Text("Learned By")
                    } icon: {
                        Image(systemName: "studentdesk")
                    }
                }
            
            MachineLocations()
                .tabItem {
                    Label {
                        Text("Locations")
                    } icon: {
                        Image(systemName: "mappin.and.ellipse")
                    }
                }
        }
        .accentColor(Color("Type_Normal"))
    }
}

struct TMsdexTabView_Previews: PreviewProvider {
    static var previews: some View {
        TMsdexTabView(vm: MachinesViewModel(), machine: MachineDetails.sample)
    }
}
