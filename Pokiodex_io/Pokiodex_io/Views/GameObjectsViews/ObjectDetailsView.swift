//
//  ObjectDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import SwiftUI

struct ObjectDetailsView: View {
    @ObservedObject var vm: ItemsViewModel
    let object: Result
    
    var body: some View {
        ScrollView{
            VStack(spacing: 30){
                Text("\(object.name.replacingOccurrences(of: "-", with: " ").capitalized) Details").font(.title2).bold()
                
                ItemImage(vm: vm)
                
                Text("\(vm.filterFlavorTextLanguage(language: "en").replacingOccurrences(of: "\n", with: " "))").italic()
                
                Divider()
                
                Text("**Category**: \(vm.itemDetails?.category.name.replacingOccurrences(of: "-", with: " ").capitalized ?? "")")
                
                if (vm.itemDetails?.cost != 0) {
                    Text("**Cost**: \(vm.itemDetails?.cost ?? 0)")
                } else {
                    Text("This item cannot be bought and/or sold...")
                }
                
                Text("**Fling Power**: \(vm.itemDetails?.flingPower ?? 0)")
                
                if vm.itemDetails?.flingEffect?.name != nil {
                    Text("**Fling Effect**: \(vm.itemDetails?.flingEffect?.name.replacingOccurrences(of: "-", with: " ").capitalized ?? "N/A")")
                }
                
                
                
                if !(vm.itemDetails?.attributes?.isEmpty ?? true){
                    Divider()
                    Text("Attributes").font(.title3).bold()
                    VStack (alignment: .leading){
                        ForEach (vm.itemDetails?.attributes ?? [URLObject]()) { attribute in
                            Text("- \(attribute.name.replacingOccurrences(of: "-", with: " ").capitalized)")
                        }
                    }
                }
            }.padding(20)
        }.onAppear{vm.getDetails(url: object.url)}
    }
    
    
}

struct ItemImage: View {
    @ObservedObject var vm: ItemsViewModel
    
    var body: some View {
        AsyncImage (url: URL(string: vm.itemDetails?.sprites?.spritesDefault ?? "")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
        } placeholder: {
            ProgressView()
                .frame(width: 75, height: 75)
        }
        .background(.thinMaterial)
        .clipShape(Circle())
    }
}

struct ObjectDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectDetailsView(vm: ItemsViewModel(), object: Result.sample)
    }
}
