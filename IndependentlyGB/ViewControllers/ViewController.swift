//
//  ViewController.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 30.01.24.
//

import UIKit

final class ViewController: UIViewController {

    private var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Учебный проект Баландина Антона"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = .white
        
        return label
    }()
    
    private let actionButton = CustomButton(withText: "Перейт на новый экран")
    private let colorButton = CustomButton(withText: "Изменить цвет")
    private let tableVCButton = CustomButton(withText: "Перейти на TableViewController")
    private let collectionVCButton = CustomButton(withText: "Перейти на CollectionViewController")
    
    
    
    private var isTap = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        
        actionButton.addTarget(self, action: #selector(goToNewScreenAction), for: .touchUpInside)
        colorButton.addTarget(self, action: #selector(changeColorAction), for: .touchUpInside)
        tableVCButton.addTarget(self, action: #selector(goToTableVCAction), for: .touchUpInside)
        collectionVCButton.addTarget(self, action: #selector(goToCollectionVCAction), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.addSubview(greetingLabel)
        view.addSubview(actionButton)
        view.addSubview(colorButton)
        view.addSubview(tableVCButton)
        view.addSubview(collectionVCButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        tableVCButton.translatesAutoresizingMaskIntoConstraints = false
        collectionVCButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
                greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
                greetingLabel.heightAnchor.constraint(equalToConstant: 100),
                
                actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                actionButton.widthAnchor.constraint(equalToConstant: view.frame.width),
                actionButton.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 20),
                
                colorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                colorButton.widthAnchor.constraint(equalToConstant: view.frame.width),
                colorButton.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 20),
                
                tableVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                tableVCButton.widthAnchor.constraint(equalToConstant: view.frame.width),
                tableVCButton.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 20),
                
                collectionVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                collectionVCButton.widthAnchor.constraint(equalToConstant: view.frame.width),
                collectionVCButton.topAnchor.constraint(equalTo: tableVCButton.bottomAnchor, constant: 20)
            ]
        )
    }
}

private extension ViewController {
    @objc func goToNewScreenAction() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
        
    @objc func changeColorAction() {
        isTap.toggle()
        if isTap {
            view.backgroundColor = .yellow
        } else {
            view.backgroundColor = .white
        }
    }
    
    @objc func goToTableVCAction() {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    @objc func goToCollectionVCAction() {
        let controller = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(controller, animated: true)    }
}

