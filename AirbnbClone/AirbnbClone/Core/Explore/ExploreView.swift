//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/10/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var isShowDesinationSearchView = false
    
    var body: some View {
        NavigationStack {
            if isShowDesinationSearchView {
                DestinationSearchView(
                    isShowView: $isShowDesinationSearchView
                )
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                isShowDesinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 30) {
                        ForEach(0...10, id: \.self) { item in
                            NavigationLink(value: item) {
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
