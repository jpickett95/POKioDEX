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
    //let details: MoveDetails
    
    var body: some View {
       
        HStack(spacing: 15) {
                VStack(alignment: .leading) {
                    Text("# \(vm.getMoveID(move: move))")     // Move index #
                        .font(Font.caption)
                    Text(move.name.capitalized)     // Move name
                        .font(Font.title3)
                        .bold()
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                .padding(.leading, 5)
                .frame(width: 125)
                
                
                // Block with (ATK## | ACC##)
                HStack{
                    
                    Text("\(vm.moveDetails?.power ?? 0 )")  // Attack Power
                    Divider()
                    Text("\(vm.moveDetails?.accuracy ?? 0)") // Accuracy
                }
                .frame(height: 25)
                .padding([.trailing,.leading], 10)
                .padding(10)
                .clipShape(Rectangle())
                .background(Color.gray.opacity(0.75))
                .cornerRadius(20)
                
                // Block for move type (fire, water, grasss, etc.) & move category (physical, status, special, etc.)
                HStack{
                    Image("TypeIcon_Poison")    // Move Type (i.e. 'grass')
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                        .background(Color.gray.opacity(0.75))
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    
                    Image("PhysicalMoveIcon")   // Move category (i.e. 'physical)
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                        .background(Color.gray.opacity(0.75))
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
            }
            .onAppear{vm.getDetails(move: move)}
            .frame(width: 375, height: 70)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(12)
        
        
        
    }
    
    
}

struct MovesdexCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovesdexCellView(vm: MovesViewModel(), move: Result.sample)
    }
}
