//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Moon Jongseek on 10/11/24.
//

import SwiftUI



struct DestinationSearchView: View {
    // Properties
    @Binding var isShowView: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 1
    
    // Body
    var locationBody: some View {
        Group {
            Text("Where to?")
                .font(.title2)
                .fontWeight(.semibold)
            HStack {
                Image(systemName: "magnifyingglass")
                    .imageScale(.small)
                TextField("Search Destinations", text: $destination)
            }
            .frame(height: 44)
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1.0)
                    .foregroundStyle(Color(.systemGray4))
            }
        }
    }
    var datesBody: some View {
        Group {
            Text("When's your trip")
                .font(.title2)
                .fontWeight(.semibold)
            VStack(alignment: .leading) {
                DatePicker("From", selection: $startDate, displayedComponents: .date)
                Divider()
                DatePicker("To", selection: $startDate, displayedComponents: .date)
            }
            .foregroundStyle(.gray)
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
    var guestsBody: some View {
        Group {
            Text("Who's coming?")
                .font(.title2)
                .fontWeight(.semibold)
            
            Stepper {
                Text("\(numGuests) Adults")
            } onIncrement: {
                numGuests += 1
            } onDecrement: {
                numGuests -= (numGuests > 0 ? 1 : 0)
            }
        }
    }
    var optionBody: some View {
        Group {
            switch selectedOption {
            case .location: locationBody
            case .dates: datesBody
            case .guests: guestsBody
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        isShowView.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            ForEach(
                DestinationSearchOptions.allCases,
                id: \.self
            ) { option in
                VStack(alignment: .leading) {
                    if selectedOption == option {
                        optionBody
                    } else {
                        CollapsedPickerView(
                            title: option.title,
                            description: option.decription
                        )
                    }
                }
                .modifier(
                    CollapsibleDestinationViewModifier(
                        selectedOption: $selectedOption,
                        option: option,
                        height: option.height
                    )
                )
            }
            
            Spacer()
        }
        
    }
}

#Preview {
    DestinationSearchView(isShowView: .constant(true))
}




