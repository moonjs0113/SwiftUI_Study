//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/10/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let imageCount = 3
    
    var body: some View {
        TabView {
            ForEach(0...imageCount, id: \.self) { _ in
                AsyncImage(url: .init(string: "https://picsum.photos/200")) { image in
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
    ListingImageCarouselView()
}
