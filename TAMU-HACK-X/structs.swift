//
//  structs.swift
//  TAMU-HACK-X
//
//  Created by rodrigo Orozco  on 1/28/24.
//

import Foundation


struct Token: Decodable   {
    var expires_in: Int
    var access_token: String
    
    
    init() {
        self.expires_in = 0
        self.access_token = ""
    }
}

enum CallError: Error {
    case fileNotFound
    case contentError
    case urlError
    case non200NetworkCode
    case jsonFormatError
    case endPointError
}


struct GeoCode: Codable {
    var latitude: Double
    var longitude: Double
    
    init()  {
        latitude = 0
        longitude = 0
    }
}


struct Instance: Codable {
    //var subtype: String
    var name: String
    var iataCode: String
    var relevance: Double
    var geoCode: GeoCode
    
    var type: String
    init()  {
        name = ""
        iataCode = ""
        relevance = 0.0
        geoCode = GeoCode()
        type = ""
    }
}

struct Response: Codable {
    var data: [Instance]
    
    init() {
        data = [Instance]()
    }
}

func readFromFile(txtFile: String) throws -> String {
    guard let file = Bundle.main.url(forResource: txtFile, withExtension: ".txt") else {
        throw CallError.fileNotFound
    }
    
    do {
        var key = try String(contentsOf: file, encoding: String.Encoding.utf8)
        key.remove(at: key.index(before: key.endIndex)) // remove new line char
        return key
    }
    
    catch {
        throw CallError.contentError
    }
}
