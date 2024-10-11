//
//  WishlistsView.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/11/24.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your sishlists")
                        .font(.headline)
                    Text("You can create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                .padding()
                
                Button {
                    
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
        
    }
}

#Preview {
    WishlistsView()
}
