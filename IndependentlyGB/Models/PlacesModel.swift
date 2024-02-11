//
//  PlacesModel.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 11.02.24.
//

struct PlacesModel: Decodable {
    var results: [Place]
}

struct Place: Decodable {
    var title: String
    var address: String
    var phone: String
}
