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
            Color.black
                .ignoresSafeArea()
            StandingsScrollView()
        }
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        DriverCard(name: "Charles Leclerc", position: "5", points: "140").previewLayout(.sizeThatFits)
    }
}


struct StandingsScrollView: View {
    @ObservedObject var f1Store = FormulaOneStore()
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(0..<f1Store.driverStandings.count, id: \.self) { index in
                    
                    let element = f1Store.driverStandings[index]
                    
                    DriverCard(name: element.fullName(),
                               position: element.position,
                               points: element.points)
                        .padding(.vertical, 5)
                    
                }
            }
        }
        .onAppear(perform: {
            f1Store.getDriverStandings()
        })
        
    }
}

struct DriverCard: View {
    
    let width = UIScreen.main.bounds.width - 10
    let height = UIScreen.main.bounds.height
    // MARK: SET TO CONSTUCTOR COLOR
    let color = Color.blue
    let name: String
    let position: String
    let points: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(color)
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
                    Text(name)
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
                    Text(position)
                        .font(.system(.title2, design: .rounded))
                        .bold()
                    Text(points)
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

