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
            List{
                ForEach(vm.filteredMoves) { move in
                    Text(move.name)
                }
            }
        }.searchable(text: $vm.searchText)
    }
}

struct MovesdexView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MovesdexView()
        }
    }
}
