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
    @FocusState private var amountIsFocused: Bool
    
    var currencyFormat: FloatingPointFormatStyle<Double>.Currency{
        let format = Locale.current.currency?.identifier ?? "IDR"
        return FloatingPointFormatStyle<Double>.Currency(code: format)
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalPerPersonWithoutDividing: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipvalue = checkAmount / 100 * tipSelection
        let grandTotal =  checkAmount + tipvalue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currencyFormat)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0...100, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section{
                    Text(totalPerPersonWithoutDividing, format: currencyFormat)
                        .foregroundColor(tipPercentage > 0 ? .primary : .red)
                } header: {
                    Text("Total Amount before dividing")
                }
                
                Section{
                    Text(totalPerPerson, format: currencyFormat)
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
