//
//  Town.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 11.02.24.
//

struct TownModel: Codable {
    let name: String
    let timezone: String
    let coords: Coordinate
    let currency: String
}

struct Coordinate: Codable {
    let lat: Double?
    let lon: Double?
}
