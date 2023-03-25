//
//  MovesdexCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import SwiftUI

struct MovesdexCellView: View {
    let move: PokemonMove
    
    var body: some View {
        ZStack {
            HStack(spacing: 30) {
                VStack(alignment: .leading) {
                    Text("#999")
                        .font(Font.caption)
                    Text(move.name.capitalized)
                        .font(Font.title)
                        .bold()
                }
                
                // Block with (ATK## | ACC##)
                HStack{
                    Text("45")
                    Divider()
                    Text("100")
                }
                .frame(height: 25)
                .padding([.trailing,.leading], 10)
                .padding(10)
                .clipShape(Rectangle())
                .background(Color.gray.opacity(0.75))
                .cornerRadius(20)
                
                // Block for move type (fire, water, grasss, etc.) & move category (physical, status, special, etc.)
                HStack{
                    
                }
            }
            
            
        }
        .frame(width: 350, height: 70)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(12)
    }
}

struct MovesdexCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovesdexCellView(move: PokemonMove.sample)
    }
}
