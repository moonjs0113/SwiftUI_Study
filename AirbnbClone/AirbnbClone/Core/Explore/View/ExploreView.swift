//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/10/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var isShowDesinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            if isShowDesinationSearchView {
                DestinationSearchView(
                    isShowView: $isShowDesinationSearchView,
                    viewModel: viewModel
                )
            } else {
                ScrollView {
                    SearchAndFilterBar(
                        location: $viewModel.searchLocation
                    )
                        .onTapGesture {
                            withAnimation(.snappy) {
                                isShowDesinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 30) {
                        ForEach(viewModel.listings) { item in
                            NavigationLink(value: item) {
                                ListingItemView(listing: item)
                                    .frame(height: 400)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
