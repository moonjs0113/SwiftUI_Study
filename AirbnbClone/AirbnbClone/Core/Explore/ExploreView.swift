//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/10/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 30) {
                    ForEach(0...10, id: \.self) { item in
                        Rectangle()
                            .frame(height: 400)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ExploreView()
}
