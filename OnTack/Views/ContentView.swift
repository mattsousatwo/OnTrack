//
//  ContentView.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/6/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var f1Store = FormulaOneStore()
    
    func getDrivers() {
        let drivers = f1Store.extractDrivers()
        print("Drivers Count: \(drivers.count)")
        for driver in f1Store.drivers {
            print("Driver: \(driver.givenName) \(driver.familyName)")
        }
    }
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            Text("Hello, world!")
                .padding()
            
                .onAppear {
                    getDrivers()
                }
        }
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
