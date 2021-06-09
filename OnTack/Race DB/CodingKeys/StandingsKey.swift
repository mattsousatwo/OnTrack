//
//  StandingsKey.swift
//  OnTack
//
//  Created by Matthew Sousa on 6/9/21.
//

import Foundation

import Foundation

// MARK: - StandingsKey
struct StandingsKey: Codable {
    var mrData: StandingMRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - MRData
struct StandingMRData: Codable {
    var xmlns: String
    var series: String
    var url: String
    var limit, offset, total: String
    var standingsTable: StandingsTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case standingsTable = "StandingsTable"
    }
}

// MARK: - StandingsTable
struct StandingsTable: Codable {
    var season: String
    var standingsLists: [StandingsList]

    enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}

// MARK: - StandingsList
struct StandingsList: Codable {
    var season, round: String
    var driverStandings: [DriverStanding]

    enum CodingKeys: String, CodingKey {
        case season, round
        case driverStandings = "DriverStandings"
    }
}

// MARK: - DriverStanding
struct DriverStanding: Codable {
    var position, positionText, points, wins: String
    var driver: Driver
    var constructors: [Constructor]

    func fullName() -> String {
        return "\(driver.givenName) \(driver.familyName)"
    }
    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case driver = "Driver"
        case constructors = "Constructors"
    }
}

// MARK: - Constructor
struct Constructor: Codable {
    var constructorID: String
    var url: String
    var name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

// MARK: - Driver
//struct Driver: Codable {
//    var driverID, permanentNumber, code: String
//    var url: String
//    var givenName, familyName, dateOfBirth, nationality: String
//
//    enum CodingKeys: String, CodingKey {
//        case driverID = "driverId"
//        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
//    }
//}
