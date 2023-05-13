//
//  MovesLearnedByView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/10/23.
//

import SwiftUI

struct MovesLearnedByView: View {
    @ObservedObject var vm: MovesViewModel
    let move: Result
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MovesLearnedByView_Previews: PreviewProvider {
    static var previews: some View {
        MovesLearnedByView(vm: MovesViewModel(), move: Result.sample)
    }
}
