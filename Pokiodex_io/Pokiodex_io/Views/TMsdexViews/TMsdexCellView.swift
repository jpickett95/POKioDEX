//
//  TMsdexCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import SwiftUI

struct TMsdexCellView: View {
    @ObservedObject var vm: MachinesViewModel
    let machine: MachineDetails
    
    var body: some View {
        HStack(spacing: 15) {
                HStack() {
                    Label {
                        Text("\(machine.item.name.uppercased())").bold()     // Move index #
                            .font(Font.title3)
                    } icon: {
                        Image(systemName: "opticaldisc.fill")
                    }
                    Spacer()
                    Text(machine.move.name.capitalized.replacingOccurrences(of: "-", with: " "))     // Move name
                        .font(Font.title3)
                        .bold()
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                .padding(.leading, 5)
                .frame(width: 300)
                
  
            }
            .frame(width: 375, height: 70)
            .background(Color.green.opacity(0.5))
            .cornerRadius(12)
    }
}

struct TMsdexCellView_Previews: PreviewProvider {
    static var previews: some View {
        TMsdexCellView(vm: MachinesViewModel(), machine: MachineDetails.sample)
    }
}
