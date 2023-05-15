//
//  AbilityDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import SwiftUI

struct AbilityDetailsView: View {
    @ObservedObject var vm: AbilitiesViewModel
    let ability: Result
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AbilityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityDetailsView(vm: AbilitiesViewModel(), ability: Result.sample)
    }
}
