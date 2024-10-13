//
//  CollapsedPickerView.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/11/24.
//

import SwiftUI

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

#Preview {
    CollapsedPickerView(
        title: "Title",
        description: "Description"
    )
}
