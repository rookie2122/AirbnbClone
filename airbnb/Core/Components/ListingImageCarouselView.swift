//
//  ListingImageCarouselView.swift
//  airbnb
//
//  Created by SENA on 14.09.2024.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let images: [String]
    var body: some View {
        TabView {
                   ForEach(images, id: \.self) { urlString in
                       AsyncImage(url: URL(string: urlString)) { image in
                           image
                               .resizable()
                               .scaledToFill()
                               .frame(height: 320)
                               .padding()
                       } placeholder: {
                           ProgressView()
                               .frame(height: 320)
                               .padding()
                       }
                   }
               }
        .tabViewStyle(PageTabViewStyle())
    }
}




#Preview {
    ListingImageCarouselView(images: ["https://a0.muscache.com/im/pictures/miso/Hosting-24978287/original/5d64189c-6d0c-4522-9358-cee5bd66f954.jpeg"])
}
