//
//  TableViewController.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 6.02.24.
//

import UIKit

final class TableViewController: UITableViewController {
    
    private let networkService = NetworkService.shared
    
    private var models: [TownModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableCell")
        
        //networkService.getData()
        //networkService.getCat(code: 404)
        //networkService.getNews()
        //networkService.getPlaces()
        //networkService.getMovies()
        
        networkService.getData { [weak self] towns in
            self?.models = towns
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        guard let cell = cell as? TableViewCell else { return UITableViewCell() }
        
        let model = models[indexPath.row]
        cell.setupTexts(town: model)
        cell.setupColor(lat: model.coords.lat, lon: model.coords.lon)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section number \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       50
    }

}
