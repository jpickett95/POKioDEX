//
//  AbilitiesdexView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import SwiftUI

struct AbilitiesdexView: View {
    @StateObject var vm = AbilitiesViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(vm.filteredAbilities){ ability in
                    NavigationLink(destination: AbilityDetailsView(vm: vm, ability: ability)) {
                        AbilityCellView(vm: vm, ability: ability)
                    }
                }
            }
        }
        .searchable(text: $vm.searchText)
    }
}

struct AbilitiesdexView_Previews: PreviewProvider {
    static var previews: some View {
        AbilitiesdexView()
    }
}
