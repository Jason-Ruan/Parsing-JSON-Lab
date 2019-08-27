//
//  JSONDecodingError.swift
//  Parsing JSON Lab
//
//  Created by Jason Ruan on 8/27/19.
//  Copyright © 2019 Jason Ruan. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}
