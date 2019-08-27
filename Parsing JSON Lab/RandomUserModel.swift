//
//  RandomUserModel.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import Foundation

struct RandomUser: Codable {
    
    let name: UserNameWrapper
    let location: LocationWrapper
    let dob: DOBWrapper
    let email: String
    let cell: String
    
    static func getRandomUser(from data: Data) throws -> [RandomUser] {
        do {
            let randomUsers = try JSONDecoder().decode([RandomUser].self, from: data)
            return randomUsers
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct UserNameWrapper: Codable {
    let title: String
    let first: String
    let last: String
}

struct LocationWrapper: Codable {
    let street: String
    let city: String
    let state: String
}

struct DOBWrapper: Codable {
    let date: String
}
