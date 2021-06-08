//
//  Driver.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/7/21.
//

import Foundation

// MARK: - Driver
struct Drivers: Codable {
    var mrData: MRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - MRData
struct MRData: Codable {
    var xmlns: String
    var series: String
    var url: String
    var limit, offset, total: String
    var driverTable: DriverTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case driverTable = "DriverTable"
    }
}

// MARK: - DriverTable
struct DriverTable: Codable {
    var season: String
    var drivers: [Driver]

    enum CodingKeys: String, CodingKey {
        case season
        case drivers = "Drivers"
    }
}

// MARK: - Driver
struct Driver: Codable {
    var driverID, permanentNumber, code: String
    var url: String
    var givenName, familyName, dateOfBirth, nationality: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}
