//
//  amadeusCalls.swift
//  TAMU-HACK-X
//
//  Created by rodrigo Orozco  on 1/27/24.
//

import Foundation

func getToken() async throws -> Token {
    let client_id = try readFromFile(txtFile: "clientID")
    let client_secret = try readFromFile(txtFile: "clientSecret")
    
//    let client_id = ""
//    let client_secret = ""
    
    let startPoint = "https://test.api.amadeus.com/v1/security/oauth2/token"
    guard let url = URL(string: startPoint),
          let payload = "grant_type=client_credentials&client_id=\(client_id)&client_secret=\(client_secret)".data(using: .utf8)    else
    {
        throw CallError.urlError
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.httpBody = payload
    
    let (data, code) = try await URLSession.shared.data(for: request)
    
    let response = code as? HTTPURLResponse
    guard response?.statusCode == 200 else {
        print(response?.statusCode ?? "-1")
        throw CallError.non200NetworkCode
    }
    
    do {
        let token = try JSONDecoder().decode(Token.self, from: data)
        return token
    }
    catch {
        print(error.localizedDescription)
        throw CallError.jsonFormatError
    }
}

func getData(cityCodes: String = "PAR", travelerCountryCode: String = "FR") async throws -> Response {
    let token = try await getToken()
    print(token.access_token)
    print("this should print after token")
    
    let endPoint = "https://test.api.amadeus.com/v1/reference-data/recommended-locations?cityCodes=\(cityCodes)&travelerCountryCode=\(travelerCountryCode)"
    
    guard let url = URL(string: endPoint) else
    {
        throw CallError.endPointError
    }
    
    var datarequest = URLRequest(url: url)
    datarequest.addValue("application/vnd.amadeus+json", forHTTPHeaderField: "accept")
    datarequest.addValue("Bearer \(token.access_token)", forHTTPHeaderField: "Authorization")
    
    let (data, code) = try await URLSession.shared.data(for: datarequest)
    
    let response = code as? HTTPURLResponse
    guard response?.statusCode == 200 else {
        print(response?.statusCode ?? "-1")
        throw CallError.non200NetworkCode
    }

    do {
        let decoded = try JSONDecoder().decode(Response.self, from: data)
        return decoded
    }
    catch {
        print(error.localizedDescription)
        throw CallError.jsonFormatError
    }
}


