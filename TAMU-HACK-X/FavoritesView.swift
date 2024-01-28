//
//  FavoritesView.swift
//  TAMU-HACK-X
//
//  Created by Hai Yen Nguyen on 1/28/24.
//

import SwiftUI

struct FavoritesView: View {
    
    var body: some View {
        VStack {
            Text("Favorite Destinations")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            
            Text("You currently don't have any Favorites")
                .font(.title3)
                .frame(alignment: .centerFirstTextBaseline)
            
            Spacer()
        }
     
    }
}

#Preview {
    FavoritesView()
}
