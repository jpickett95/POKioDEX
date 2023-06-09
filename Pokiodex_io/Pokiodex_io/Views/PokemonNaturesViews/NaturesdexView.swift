//
//  NaturesdexView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import SwiftUI

struct NaturesdexView: View {
    @StateObject var vm = NaturesViewModel()
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(vm.filteredNatures){ nature in
                    NatureCellView(vm: vm, nature: nature)
                }
            }
        }
        .searchable(text: $vm.searchText)
        .navigationTitle("Pokemon Natures")
    }
}

struct NaturesdexView_Previews: PreviewProvider {
    static var previews: some View {
        NaturesdexView()
    }
}
