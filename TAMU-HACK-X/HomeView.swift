//
//  HomeView.swift
//  TAMU-HACK-X
//
//  Created by Hai Yen Nguyen on 1/27/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Text("Top 10 Destinations of the Week")
                .fontWeight(.bold)
                .font(.title2)
            
            List {
                DestinationCardView(destination: destination1)
                    .listRowSeparator(.hidden)
                DestinationCardView(destination: destination2)
                    .listRowSeparator(.hidden)
                DestinationCardView(destination: destination3)
                    .listRowSeparator(.hidden)
                DestinationCardView(destination: destination4)
            }
            .listStyle(.plain)
        }
        
    }
}


#Preview {
    HomeView()
}
