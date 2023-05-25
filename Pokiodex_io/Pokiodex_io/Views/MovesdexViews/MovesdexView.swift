//
//  MovesdexView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/21/23.
//

import SwiftUI

struct MovesdexView: View {
    @StateObject var vm = MovesViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(vm.filteredMoves){ move in
                    NavigationLink(destination: MovesdexTabView(vm: vm, move: move)) {
                        
                            MovesdexCellView(vm: vm, move: move)
                        
                    }.onAppear{vm.getDetails(move: move)}
                }
            }
        }
        .searchable(text: $vm.searchText)
        .navigationTitle("Moves")
    }
}

struct MovesdexView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MovesdexView()
        }
    }
}
