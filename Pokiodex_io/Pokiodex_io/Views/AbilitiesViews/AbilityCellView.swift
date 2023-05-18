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
            
                Image(systemName: "sparkles").foregroundColor(Color.white).scaledToFit()
                
                Text(ability.name.capitalized.replacingOccurrences(of: "-", with: " "))     // Ability name
                    .font(Font.title3)
                    .bold()
                    .lineLimit(1)
                    .truncationMode(.tail)
                
           Spacer()
                
  
        }
        .padding(20)
        .frame(width: 375, height: 70)
        .background(Color.purple.opacity(0.25))
        .cornerRadius(12)
    }
}

struct AbilityCellView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityCellView(vm: AbilitiesViewModel(), ability: Result.sample)
    }
}
