//
//  CurrencyConvView.swift
//  TAMU-HACK-X
//
//  Created by Hai Yen Nguyen on 1/27/24.
//

import SwiftUI

struct CurrencyConvView: View {
    @State private var BaseCurr = 0
    @State private var TargetCurr = 1
    @State private var amount = 0.0
    private let currencies = ["USD", "GBP", "EUR"]
    
    func converter(_ converter: Double) -> Double {
        var conversion: Double = 1.0
        let amount = Double(converter)
        let selectedCurr = currencies[BaseCurr]
        let convertTo = currencies[TargetCurr]
        
        let usdRates = ["USD": 1.0, "EUR": 0.92, "GBP": 0.79]
        let gbpRates = ["USD": 1.27, "EUR": 1.17, "GBP": 1.0]
        let euroRates = ["USD": 1.09, "EUR": 1.0, "GBP": 0.85]
       
        switch (selectedCurr) {
        case "USD" :
            conversion = amount * (usdRates[convertTo] ?? 0.0)
        case "GBP" :
            conversion = amount * (gbpRates[convertTo] ?? 0.0)
        case "EUR" :
            conversion = amount * (euroRates[convertTo] ?? 0.0)
        default:
            print("Can't Convert")
        }
        
        return conversion
    }
    
    var body: some View {
        NavigationStack {
            Text("Currency Converter")
              .fontWeight(.bold)
              .font(.title)
              .padding(.top)
           
            VStack (alignment: .leading) {
                Text("Enter the Amount")
                    .fontWeight(.bold)
                    .font(.title2)
           
                    TextField("...", value: $amount, format: .currency(code: currencies[BaseCurr]))
                        .font(.title)
                        .padding(.bottom)
                        .keyboardType(.decimalPad)
                
                
                VStack {
                    HStack {
                        Text("From")
                        Picker(selection: $BaseCurr, label: Text("From")){
                            ForEach(0 ..< 3) { index in
                                Text(self.currencies[index]).tag(index)
                            }
                        }
                        .frame(width: 250, alignment: .trailing)
                    }
                  
                    HStack {
                        Text("To")
                        Picker(selection: $TargetCurr, label: Text("To")){
                            ForEach(0 ..< 3) { index in
                                Text(self.currencies[index]).tag(index)
                            }
                        }
                        .frame(width: 270, alignment: .trailing)
                    }
            
                }
            }
                .frame(maxWidth:300, alignment: .leading)
                .padding()
                .background()
                .cornerRadius(15)
                .shadow(radius:3)
                .padding(.bottom)
            
            
            VStack (alignment: .leading){
                Text("Conversion")
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding(.bottom, 5)
                
                Text(converter(amount), format: .currency(code: currencies[TargetCurr]))
                    .font(.title)
                
            }
                .frame(maxWidth:300, alignment: .leading)
                .padding()
                .background()
                .cornerRadius(15)
                .shadow(radius:3)
                Spacer()
            }
        }
    }
    


#Preview {
    CurrencyConvView()
}
