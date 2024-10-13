//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/10/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let imageURLs: [String]
    
    var body: some View {
        TabView {
            ForEach(imageURLs, id: \.self) { urlString in
                AsyncImage(url: .init(string: urlString)) { image in
                    image
                        .image?
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(imageURLs: [
        "https://picsum.photos/id/128/1024",
        "https://picsum.photos/id/275/1024",
        "https://picsum.photos/id/993/1024",
        "https://picsum.photos/id/678/1024"
    ])
}
