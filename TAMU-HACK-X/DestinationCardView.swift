//
//  DestinationCardView.swift
//  TAMU-HACK-X
//
//  Created by Hai Yen Nguyen on 1/27/24.
//

import SwiftUI

struct DestinationCardView: View {
    let destination: Destination
    
    
    var body: some View {
        VStack {
            ZStack {
                Image(destination.DestinationImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 190)
                    .clipped()
            }
            
            VStack {
                HStack {
                    VStack {
                        Text(destination.name)
                            .fontWeight(.bold) //
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        HStack {
                            Image(systemName: "location.fill")
                                .padding(.leading)
                            
                            Text(destination.location)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    Button {
                        //?
                    } label: {
                        Text("Explore")
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .overlay {
                                Capsule()
                                    .stroke(lineWidth: 2)
                            }
                    }
                    .padding(.trailing)
                }
            }
            .padding(.top)
            .padding(.bottom)
        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(15)
    }
}

#Preview {
    DestinationCardView(destination: destination1)
        .previewLayout(.sizeThatFits)
}
