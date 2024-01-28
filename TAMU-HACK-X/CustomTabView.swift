//
//  CustomTabView.swift
//  TAMU-HACK-X
//
//  Created by Hai Yen Nguyen on 1/27/24.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animation
    
    let tabBarIcons: [(image: String, title: String)] = [
        ("house", "Home"),
        ("magnifyingglass", "Search"),
        ("heart", "Saved"), //still need one tab for cool functions like curr converter
        ("dollarsign", "CurrX")
        //("gear", "Settings")
    ]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height:70)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 3)
            
            HStack {
                ForEach(0..<4) { index in
                    Button {
                        tabSelection = index+1
                    } label: {
                        VStack(spacing:3) {
                            Spacer()
                            Image(systemName: tabBarIcons[index].image)
                            Text(tabBarIcons[index].title)
                                .font(.caption)
                            
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/) //change color
                                    .matchedGeometryEffect(id: "SelectedTab", in: animation) ///animationNamespace?
                                    .offset(y:3)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y:3)
                            }
                         
                        }
                        .foregroundColor(index + 1 == tabSelection ? .blue : .gray)
                        
                    }
                }
            }
            .frame(height: 70)
            .clipShape(Capsule())
            //.padding()
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomTabView(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
