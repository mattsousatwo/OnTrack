//
//  StandingsView.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/10/21.
//

import SwiftUI
import Combine

struct StandingsView: View {
    
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
//            Color.black
//                .ignoresSafeArea()
            StandingsScrollView()
        }
    }
}

//struct StandingsView_Previews: PreviewProvider {
//    static var previews: some View {
//
//    }
//}

