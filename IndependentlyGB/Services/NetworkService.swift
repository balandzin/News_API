//
//  NetworkService.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 8.02.24.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private let session = URLSession.shared
    
    private init() {}
    
    func getData(completion: @escaping (([TownModel]) -> Void)) {
        let url = URL(string: "https://kudago.com/public-api/v1.2/locations/?lang=ru&fields=timezone,name,currency,coords")
        
        guard let url else { return }
        
        
        session.dataTask(with: url) { data, _, error in
            guard let data else { return }
            
            do {
                let towns = try JSONDecoder().decode([TownModel].self, from: data)
                completion(towns)
                print(towns)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getCat(code: Int) {
        let url = URL(string: "https://http.cat/" + String(code))
        
        guard let url else { return }
        
        session.dataTask(with: url) { data, _, _ in
            guard let data else { return }
            print(data)
        }.resume()
    }
    
    func getNews() {
        let url = URL(string: "https://kudago.com/public-api/v1.2/news/?fields=publication_date,title,body_text&text_format=text&actual_only=true")

        session.dataTask(with: url!) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let news = try JSONDecoder().decode(NewsModel.self, from: data)
                print(news)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPlaces() {
        let url = URL(string: "https://kudago.com/public-api/v1.2/places/")

        session.dataTask(with: url!) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let places = try JSONDecoder().decode(PlacesModel.self, from: data)
                print(places)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getMovies() {
        let url = URL(string: "https://kudago.com/public-api/v1.2/movies/?fields=site_url,title,body_text,country,year,imdb_rating")

        session.dataTask(with: url!) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let movies = try JSONDecoder().decode(MoviesModel.self, from: data)
                print(movies)
            } catch {
                print(error)
            }
        }.resume()
    }
}

