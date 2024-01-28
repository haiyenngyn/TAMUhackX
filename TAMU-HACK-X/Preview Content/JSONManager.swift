//
//  JSONManager.swift
//  TAMU-HACK-X
//
//  Created by Hai Yen Nguyen on 1/28/24.
//

import Foundation

struct Info: Codable {
    var type, destination, subtype: String
    static let allInfo: [Info] = Bundle.main.decode(file: "example.json")
    static let sampleInfo: Info = allInfo[0]
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find in the project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Cant load")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Cant load")
        }
        return loadedData
    }
}
