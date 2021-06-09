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
//            Text("Hello, world!")
//                .padding()
            
                DriverList()
                
//                .onAppear {
//                    getDrivers()
//                }
        }
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        DriverCard().previewLayout(.sizeThatFits)
    }
}


struct DriverList: View {
    @ObservedObject var f1Store = FormulaOneStore()
    var body: some View {
        VStack {
            ForEach(0..<f1Store.drivers.count, id: \.self) { index in
                Text("\(f1Store.drivers[index].givenName) \(f1Store.drivers[index].familyName)")
                    .padding(.vertical, 5)
                
            }
        }
        .onAppear(perform: {
            f1Store.getAllDrivers()
        })
        
    }
}

struct DriverCard: View {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    // MARK: SET TO CONSTUCTOR COLOR
    let color = UIColor.blue
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.blue)
            .frame(width: width,
                   height: height / 4,
                   alignment: .center)
        
            // MARK: DRIVER NAME / CONSTRUCTOR LOGO
            .overlay(
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: width / 8,
                               height: height / 15,
                               alignment: .center)
                    Text("Max Verstappen")
                        .font(.system(.title3, design: .rounded))
                        .bold()
                    
                }
                .padding()
                , alignment: .topLeading)
            
            // MARK: DRIVER IMAGE
            .overlay(
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: width / 3,
                               height: height / 5)
                        .padding(.horizontal)
                }
                , alignment: .trailing)
            
            // MARK: POINTS / PLACEMENT
            .overlay(
                VStack {
                    Text("Place")
                        .font(.system(.title2, design: .rounded))
                        .bold()
                    Text("Points")
                        .font(.system(.title2, design: .rounded))
                        .italic()
                        .bold()
                        .foregroundColor(.green)
                        
                }
                    .padding()
                , alignment: .bottomLeading
                
            )
    }
}

