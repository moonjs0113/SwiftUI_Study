//
//  CollapsibleDestinationViewModifier.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/11/24.
//

import SwiftUI

struct CollapsibleDestinationViewModifier: ViewModifier {
    @Binding var selectedOption: DestinationSearchOptions
    let option: DestinationSearchOptions
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: selectedOption == option ? height : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = option
                }
            }
    }
}
