//
//  UIImageView+Extensions.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 11.02.24.
//

import UIKit

extension UIImageView {
    func downloadDogImage() {
        guard let url = URL(string: "https://random.dog/woof.json") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let imageURL = try JSONDecoder().decode(ImageModel.self, from: data).url
                guard let imageURL = URL(string: imageURL) else { return }
                session.dataTask(with: imageURL) { (data, _, error) in
                    guard let data = data, let image = UIImage(data: data) else {
                        return
                    }
                    DispatchQueue.main.async { () -> Void in
                        self.image = image
                    }
                }.resume()
            } catch {
                print(error)
            }
        }.resume()
    }
}
