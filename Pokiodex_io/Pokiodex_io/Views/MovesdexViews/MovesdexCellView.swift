//
//  MovesdexCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import SwiftUI

struct MovesdexCellView: View {
    @ObservedObject var vm: MovesViewModel
    let move: Result
    
    var body: some View {
       
        HStack(spacing: 15) {
            
                    Text("# \(vm.getMoveID(move: move))")     // Move index #
                        .font(Font.subheadline)
                
                    Spacer()
                
                    Text(move.name.capitalized.replacingOccurrences(of: "-", with: " "))     // Move name
                        .font(Font.title3)
                        .bold()
                        .lineLimit(1)
                        .truncationMode(.tail)

            
            }
            .padding(40)
            .onAppear{vm.getDetails(move: move)}
            .frame(width: 375, height: 70)
            .background(Color.yellow.opacity(0.25))
            .cornerRadius(12)
    }
}

struct MovesdexCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovesdexCellView(vm: MovesViewModel(), move: Result.sample)
    }
}
