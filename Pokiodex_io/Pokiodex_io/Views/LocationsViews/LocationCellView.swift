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
                
                Spacer()
                
                // Location name
                Text(location.name.replacingOccurrences(of: "-", with: " ").capitalized)
                    .font(Font.title3)
                    .bold()
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .padding(.leading, 5)
            .frame(width: 300)
                
  
        }
        .frame(width: 375, height: 70)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(12)
    }
}

struct LocationCellView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCellView(vm: LocationsViewModel(), location: Result.sample)
    }
}
