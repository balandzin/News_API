//
//  MoviesModel.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 11.02.24.
//

struct MoviesModel: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {
    var url: String
    var title: String
    var text: String
    var country: String
    var year: Int
    var rating: Double

    enum CodingKeys: String, CodingKey {
        case url = "site_url"
        case title
        case text = "body_text"
        case country
        case year
        case rating = "imdb_rating"
    }
}
