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
