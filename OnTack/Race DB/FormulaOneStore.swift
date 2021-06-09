//
//  FormulaOneStore.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/7/21.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

class FormulaOneStore: ObservableObject {
    let decoder = JSONDecoder()
    
    @Published var drivers = [Driver]()
    @Published var driverStandings = [DriverStanding]()
    
    func getAllDrivers() {
        let request = "https://ergast.com/api/f1/current/drivers.json"
        AF.request( request ).responseJSON { response in
            guard let json = response.data else { return }
            do {
                print("Fetching")
                let decodedDrivers = try self.decoder.decode(Drivers.self, from: json)

                self.drivers = decodedDrivers.mrData.driverTable.drivers
            } catch {
                print(error)
            }
            print("Drivers Count: \(self.drivers.count)")
            
        }
        
    }
    
    
    func extractDrivers() -> [Driver] {
        var pilots = [Driver]()
        
        if self.drivers.count == 0 {
            getAllDrivers()
        } else {
            return self.drivers
        }
        
        pilots = self.drivers

        return pilots
    }
     
}


extension FormulaOneStore {
    
    func getDriverStandings() {
        let request = "https://ergast.com/api/f1/current/driverStandings.json"
        
        AF.request( request ).responseJSON { response in
            guard let json = response.data else { return }
            do {
                print("Fetching Driver Standings")
                let decodedStandings = try self.decoder.decode(StandingsKey.self, from: json)
                let standingsList = decodedStandings.mrData.standingsTable.standingsLists
                guard let driverStandings = standingsList.first else { return }
                self.driverStandings = driverStandings.driverStandings
                
            } catch {
                print(error)
            }
            print("Standings Count: \(self.driverStandings.count)")
            for ranking in self.driverStandings {
                print("\(ranking.driver.givenName) \(ranking.driver.familyName): \(ranking.position)")
            }
        }
    }
    
    
}
