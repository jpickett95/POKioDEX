//
//  ObjectCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import SwiftUI

struct ObjectCellView: View {
    @ObservedObject var vm: ItemsViewModel
    let object: Result
    
    var body: some View {
        HStack(spacing: 15) {
            HStack() {
                Text("")     // Ability index #
                    .font(Font.title3)
                Spacer()
                Text(object.name.replacingOccurrences(of: "-", with: " ").capitalized)     // Ability name
                    .font(Font.title3)
                    .bold()
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .padding(.leading, 5)
            .frame(width: 300)
                
  
        }
        .frame(width: 375, height: 70)
        .background(Color.brown.opacity(0.5))
        .cornerRadius(12)
    }
}

struct ObjectCellView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectCellView(vm: ItemsViewModel(), object: Result.sample)
    }
}
