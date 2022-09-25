//
//  ContentView.swift
//  WeSplit-HWS-P1
//
//  Created by Ade Dwi Prayitno on 23/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form{
            Section{
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
            }
            Section{
                Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
