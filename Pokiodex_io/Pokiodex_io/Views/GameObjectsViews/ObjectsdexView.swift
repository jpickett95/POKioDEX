//
//  ObjectsdexView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import SwiftUI

struct ObjectsdexView: View {
    @StateObject var vm = ItemsViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(vm.itemsList){ item in
                    NavigationLink(destination: ObjectDetailsView(vm: vm, object: item)) {
                        ObjectCellView(vm: vm, object: item)
                    }//.onAppear{}
                }
            }
        }
        .searchable(text: $vm.searchText)
    }
}

struct ObjectsdexView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectsdexView(vm: ItemsViewModel())
    }
}
