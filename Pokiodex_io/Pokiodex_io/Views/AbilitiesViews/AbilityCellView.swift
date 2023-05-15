//
//  AbilityCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import SwiftUI

struct AbilityCellView: View {
    @ObservedObject var vm: AbilitiesViewModel
    let ability: Result
    
    var body: some View {
        HStack(spacing: 15) {
            HStack() {
                Text("")     // Ability index #
                    .font(Font.title3)
                Spacer()
                Text(ability.name)     // Ability name
                    .font(Font.title3)
                    .bold()
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .padding(.leading, 5)
            .frame(width: 300)
                
  
        }
        .frame(width: 375, height: 70)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(12)
    }
}

struct AbilityCellView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityCellView(vm: AbilitiesViewModel(), ability: Result.sample)
    }
}
