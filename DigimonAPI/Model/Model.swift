//
//  IntroModel.swift
//  DigimonAPI
//
//  Created by user220831 on 1/4/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
import Foundation
import UIKit

// MARK: - DigimonModel
struct DigimonModel: Codable {
    let name: String?
    let img: String?
    let level: String?
}

typealias Digimons = [DigimonModel]
