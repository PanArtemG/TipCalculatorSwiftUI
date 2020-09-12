//
//  ContentView.swift
//  TipCalculator
//
//  Created by Artem Panasenko on 12.09.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPersetage = 0
    
    private let tipPersetages = [0, 5, 10, 15, 20]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPersetages[tipPersetage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How mach tip?")) {
                    Picker("Tip persetage", selection: $tipPersetage) {
                        ForEach(0..<tipPersetages.count) {
                            Text("\(self.tipPersetages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f") $")
                }
            }
            .navigationBarTitle("Tip Calculator", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
