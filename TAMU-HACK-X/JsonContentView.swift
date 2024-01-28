//
//  JsonContentView.swift
//  TAMU-HACK-X
//
//  Created by Hai Yen Nguyen on 1/28/24.
//

import SwiftUI

struct JsonContentView: View {
    private var info: [Info] = Info.allInfo
    var body: some View {
        NavigationView {
            List {
                ForEach(info, id: \.type) { info in
                    Text("\(info.type)")
                }
            }
        }
    }
}

#Preview {
    JsonContentView()
}
