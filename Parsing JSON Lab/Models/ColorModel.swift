//
//  ColorModel.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import Foundation

struct Color: Codable {
    
    let name: NameWrapper
    let hex: HexWrapper
    let rgb: RGBWrapper
    
    static func getColor(from data: Data) throws -> [Color] {
        do {
            let colors = try JSONDecoder().decode([Color].self, from: data)
            return colors
        } catch {
            throw JSONError.decodingError(error)
        }
    }
    
}

struct NameWrapper: Codable {
    let value: String
}

struct HexWrapper: Codable {
    let value: String
}

struct RGBWrapper: Codable {
    let value: String
    let fraction: FractionWrapper
}

struct FractionWrapper: Codable {
    let r: Float
    let g: Float
    let b: Float
}
