//
//  TableViewCell.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 6.02.24.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    let circle: UIView = {
        let circle = UIView()
        circle.layer.cornerRadius = 25
        circle.backgroundColor = .red
        return circle
    }()
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        return stackView
    }()
    
    private let text1: UILabel = {
       let label = UILabel()
        label.text = "Text1"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let text2: UILabel = {
       let label = UILabel()
        label.text = "Text2"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let text3: UILabel = {
       let label = UILabel()
        label.text = "Text3"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        text1.text = nil
        text2.text = nil
        text3.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupColor(lat: Double?, lon: Double?) {
        guard let lat, let lon else {
            circle.backgroundColor = .gray
            return
        }
        if lat + lon < 100 {
            circle.backgroundColor = .blue
        } else {
            circle.backgroundColor = .purple
        }
    }
    
    func setupTexts(town: TownModel) {
        text1.text = town.name
        text2.text = town.timezone
        text3.text = town.currency
    }
    
    
    private func setupViews() {
        contentView.addSubview(circle)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(text1)
        stackView.addArrangedSubview(text2)
        stackView.addArrangedSubview(text3)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            circle.heightAnchor.constraint(equalToConstant: 50),
            circle.widthAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
    
    

}
