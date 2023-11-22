//
//  AnimalResponse.swift
//  LazyAnimalGallery
//
//  Created by Pranav Pratap on 31/10/23.
//

import UIKit

struct AnimalResponse: Decodable {
    let errorMessage: String
    let animals: [Animal]
    
    enum CodingKeys: String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}

struct Animal: Decodable {
    let name: String
    let image: String
}

enum RequestError: Error {
    case invalidUrl
    case failedRequest(error: Error?)
    case errorDecode
    case unknownError
}

