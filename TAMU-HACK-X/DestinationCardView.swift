//
//  DestinationCardView.swift
//  TAMU-HACK-X
//
//  Created by Hai Yen Nguyen on 1/27/24.
//

import SwiftUI

struct DestinationCardView: View {
    let destination: Destination
    
    @State var LikePress = Set([0])
    
    var body: some View {
        VStack {
            ZStack {
                Image(destination.DestinationImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 190)
                    .clipped()
            }
            .overlay(alignment: .topTrailing) {
                Button {
                 
                } label: {
                    Image(systemName:"heart")
                        .padding(15)
                        .font(.system(size: 35))
                        .symbolVariant(.circle.fill)
                        .foregroundStyle(.white)
                    
                }
            }
            
            VStack {
                HStack {
                    VStack {
//                        Text(destination.name)
//                            .fontWeight(.bold) //
//                            .font(.title2)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.leading)
                        HStack {
                            Image(systemName: "location.fill")
                                .padding(.leading)
                            
                            Text(destination.location)
                                .fontWeight(.bold) //
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                //.padding()
                        
                        }
                        
                        Text("Relevance: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            
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
