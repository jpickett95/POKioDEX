//
//  NatureCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import SwiftUI

struct NatureCellView: View {
    @ObservedObject var vm: NaturesViewModel
    let nature: Result
    
    var body: some View {
        HStack(spacing: 15) {
            HStack() {
                Text(nature.name.capitalized)     // Nature name
                    .font(Font.title3)
                    .bold()
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Spacer()
                
                Label {
                    Text("\(vm.switchStatName(stat: vm.natureDetails?.increasedStat?.name ?? "N/A"))")
                } icon: { Image(systemName: "arrow.up").foregroundColor(Color.green) }
                Label {
                    Text("\(vm.switchStatName(stat: vm.natureDetails?.decreasedStat?.name ?? "N/A"))")
                } icon: { Image(systemName: "arrow.down").foregroundColor(Color.red) }
                
            }
            .padding(.leading, 5)
            .frame(width: 300)
            .onAppear{vm.getNatureDetails(url: nature.url)}
                
  
        }
        .frame(width: 375, height: 70)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(12)
    }
}

struct NatureCellView_Previews: PreviewProvider {
    static var previews: some View {
        NatureCellView(vm: NaturesViewModel(), nature: Result.sample)
    }
}
