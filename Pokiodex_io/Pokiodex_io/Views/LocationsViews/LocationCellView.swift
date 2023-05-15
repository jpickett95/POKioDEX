//
//  LocationCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import SwiftUI

struct LocationCellView: View {
    @ObservedObject var vm: LocationsViewModel
    let location: Result
    
    var body: some View {
        HStack(spacing: 15) {
            HStack() {
                Text("")     // Location index #
                    .font(Font.title3)
                Spacer()
                Text(location.name.replacingOccurrences(of: "-", with: " ").capitalized)     // Location name
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

struct LocationCellView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCellView(vm: LocationsViewModel(), location: Result.sample)
    }
}
