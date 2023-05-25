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
                // Name
                Text(nature.name.capitalized)
                    .font(Font.title3)
                    .bold()
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Spacer()
                VStack(spacing: 5) {
                    // Likes Flavor
                    Label {
                        Text("\(vm.natureDetails?.likesFlavor?.name ?? "")")
                    } icon: { Image(systemName: "heart.fill").foregroundColor(Color.green) }
                    
                    // Hates Flavor
                    Label {
                        Text("\(vm.natureDetails?.hatesFlavor?.name ?? "")")
                    } icon: { Image(systemName: "x.circle.fill").foregroundColor(Color.red) }
                }
                
                Spacer()
                VStack(spacing: 5){
                    // Increased Stat
                    Label {
                        Text("\(vm.switchStatName(stat: vm.natureDetails?.increasedStat?.name ?? ""))")
                    } icon: { Image(systemName: "arrow.up").foregroundColor(Color.green) }
                    
                    // Decreased Stat
                    Label {
                        Text("\(vm.switchStatName(stat: vm.natureDetails?.decreasedStat?.name ?? ""))")
                    } icon: { Image(systemName: "arrow.down").foregroundColor(Color.red) }
                }
            }
            .padding(.leading, 5)
            .frame(width: 300)
            .onAppear{vm.getNatureDetails(url: nature.url)}
        }
        .frame(width: 375, height: 70)
        .background(Color.green.opacity(0.25))
        .cornerRadius(12)
    }
}

struct NatureCellView_Previews: PreviewProvider {
    static var previews: some View {
        NatureCellView(vm: NaturesViewModel(), nature: Result.sample)
    }
}
