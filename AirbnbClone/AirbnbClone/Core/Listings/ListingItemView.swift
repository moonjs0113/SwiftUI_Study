//
//  ListingItemView.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/10/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = (0...3)
//    [
//        "listing-1",
//        "listing-2",
//        "listing-3",
//        "listing-4",
//    ]
    var listing: Listing = Listing.mockData.randomElement()!
    
    var body: some View {
        VStack(spacing: 8) {
            TabView {
                ForEach(images, id: \.self) { _ in
                    AsyncImage(url: .init(string: "https://picsum.photos/200")) { image in
                        image
                            .image?
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .frame(height: 320)
            .clipShape(
                RoundedRectangle(cornerRadius: 10)
            )
            .tabViewStyle(.page)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                Spacer()
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}
