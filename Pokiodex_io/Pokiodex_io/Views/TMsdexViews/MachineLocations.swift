//
//  MachineLocations.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import SwiftUI

struct MachineLocations: View {
    @ObservedObject var vm: MachinesViewModel
    let machine: MachineDetails
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MachineLocations_Previews: PreviewProvider {
    static var previews: some View {
        MachineLocations(vm: MachinesViewModel(), machine: MachineDetails.sample)
    }
}
