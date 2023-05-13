//
//  MovesdexTabView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/10/23.
//

import SwiftUI

struct MovesdexTabView: View {
    @ObservedObject var vm: MovesViewModel
    let move: Result
    
    var body: some View {
        TabView {
            MoveDetailsView(vm: vm, move: move)
                .tabItem{
                    Label {
                        Text("Details")
                    } icon: {
                        Image(systemName: "person.text.rectangle.fill")
                    }
                }
            
            MovesLearnedByView(vm: vm, move: move)
                .tabItem{
                    Label {
                        Text("Learned By")
                    } icon: {
                        Image(systemName: "studentdesk")
                    }
                }
        }
        .accentColor(Color("Type_\(vm.moveDetails?.type.name.capitalized ?? "Normal")"))
    }
}

struct MovesdexTabView_Previews: PreviewProvider {
    static var previews: some View {
        MovesdexTabView(vm: MovesViewModel(), move: Result.sample)
    }
}
