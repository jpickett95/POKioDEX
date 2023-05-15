//
//  ObjectDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import SwiftUI

struct ObjectDetailsView: View {
    @ObservedObject var vm: ItemsViewModel
    let object: Result
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ObjectDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectDetailsView(vm: ItemsViewModel(), object: Result.sample)
    }
}
