//
//  ContentView.swift
//  TAMU-HACK-X
//
//  Created by rodrigo Orozco  on 1/27/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var tabSelection = 1;
    
    var body: some View {
    
        TabView(selection: $tabSelection) {
            HomeView()  //Destination Card List
                .tag(1)
            Storyboardview().edgesIgnoringSafeArea(.all)
                .tag(2)
            FavoritesView()
                .tag(3)
            CurrencyConvView()
                .tag(4)
//            Text("Tab Content 5")
//                .tag(5)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(tabSelection: $tabSelection)
        }
       
    }
      
}

struct Storyboardview: UIViewControllerRepresentable {
    func makeUIViewController(context content: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "Home")
        
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
    
#Preview {
    ContentView()
}
