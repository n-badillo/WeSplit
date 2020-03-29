// main files
//
//  ContentView.swift
//  Simple_App
//
//  Created by Nancy Badillo on 2/2/20 following WeSplit tutorial by Paul Hudson.
//  Copyright © 2020 CSU, Fullerton. All rights reserved.
//
// LinareGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPOint: .bottom)
// can be gradient: Gradient(colors: [.black, .blue]), center: .center, startRadius: 20, endRadius: 20)
// AngularGradient(gradient: Gradient(colors: [.red, .yellow, . green, .blue, .red]), crenter: .center

// Alert(title: Text(), message: Text(), dismissButton: .defualt(Text

import SwiftUI  // use all the functionality from the SwiftUI library


// View comes from swiftUI and is required fror all items that are VIEWED on the screen
// the property must return ONE view

struct ContentView: View{
    @State private var checkAmount = "";
    @State private var numberOfPeople = 2;
    @State private var tipPercentageIndex = 2;
    // changed the name of tipPercentage to tipPercentageIndex to be more clear
    

    let tipPercentages = [10, 15, 20, 25, 0];
    
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentageIndex])
        let orderAmount = Double(checkAmount) ?? 0;

        
        let tipValue = orderAmount / 100 * tipSelection;
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson;
    }
    
    var body: some View{
        NavigationView{
        
        Form{
            Section{
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
            
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2 ..< 100){
                        Text("\($0) people")
                    }
                }
            }
            
            Section(header: Text("How much tip do you want to leave?")){
                Picker("Tip Percentage", selection: $tipPercentageIndex){
                    ForEach(0 ..< tipPercentages.count){
                        Text("\(self.tipPercentages[$0])%")
                    }
                
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section{
                Text("$\(totalPerPerson, specifier: "%.2f")")
            }
            .navigationBarTitle("WeSplit")
            }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider { // won't be in the final app, but it is to make a preview.
    // and edits will reflect on the canvas but not on the product itself.
    static var previews: some View {
        ContentView()
    }
}
