//
//  Network.swift
//  DigimonAPI
//
//  Created by user220831 on 1/4/23.
//

import Foundation

struct Network {
    enum EndPoints {
        static var digimonData: URL? {URL(string: "https://digimon-api.vercel.app/api/digimon")}
    }
    static func call(from url: URL?) async -> Data? {

        guard let url = url else {print("ERROR: Wrong url"); return nil}

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("RESPONSE:", response)
            return data
        } catch {print("ERROR: \(error)"); return nil}
    }
    static func decode<T: Codable>(_ model: T.Type, from data: Data) async -> T? {

        do {

            return try JSONDecoder().decode(model.self, from: data)
        } catch {print("ERROR: \(error): \(String(data: data, encoding: .ascii) ?? "?")"); return nil}
    }
    static func read<T: Codable>(_ what: T.Type, from file: String, type: String = "json") -> T? {
        guard let url = Bundle.main.url(forResource: file, withExtension: type) else {
            print("ERROR: File not found"); return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            print("ERROR: Unable to assign data"); return nil
        }
        guard let model = try? JSONDecoder().decode(T.self, from: data) else {
            print("ERROR: Could not decode file"); return nil
        }
        return model
    }
}
