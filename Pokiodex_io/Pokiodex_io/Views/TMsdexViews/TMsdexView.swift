//
//  TMsdexView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/22/23.
//

import SwiftUI

struct TMsdexView: View {
    @StateObject var vm = MachinesViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(vm.filteredMoves){ machine in
                    NavigationLink(destination: TMsdexTabView(vm: vm, machine: machine)) {
                        TMsdexCellView(vm: vm, machine: machine)
                    }.onAppear{}
                }
            }
        }
        .searchable(text: $vm.searchText)
        .navigationTitle("Technical/Hidden Machines")
    }
}

struct TMsdexView_Previews: PreviewProvider {
    static var previews: some View {
        TMsdexView()
    }
}
