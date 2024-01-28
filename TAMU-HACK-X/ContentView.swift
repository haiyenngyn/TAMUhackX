//
//  ContentView.swift
//  TAMU-HACK-X
//
//  Created by rodrigo Orozco  on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1;
    
    var body: some View {
    
        TabView(selection: $tabSelection) {
            HomeView()  //Destination Card List
                .tag(1)
            Text("Tab Content 2")
                .tag(2)
            Text("Tab Content 3")
                .tag(3)
            CurrencyConvView()
                .tag(4)
            Text("Tab Content 5")
                .tag(5)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(tabSelection: $tabSelection)
        }
       
          
    }
      
}
    
#Preview {
    ContentView()
}
