//
//  News.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 11.02.24.
//

struct NewsModel: Decodable {
    let results: [News]
}

struct News: Decodable {
    let data: Int
    let title: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case data = "publication_date"
        case title
        case text = "body_text"
    }
}
