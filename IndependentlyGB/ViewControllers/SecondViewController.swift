//
//  SecondViewController.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 30.01.24.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private var view1: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private var view2: UIView = {
       let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private var view3: UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private var view4: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private var view5: UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        
        return view
    }()
    
    private var view6: UIView = {
       let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second VC from title string"

        view.backgroundColor = .green
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        view.addSubview(view5)
        view.addSubview(view6)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view3.translatesAutoresizingMaskIntoConstraints = false
        view4.translatesAutoresizingMaskIntoConstraints = false
        view5.translatesAutoresizingMaskIntoConstraints = false
        view6.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            view1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -4),
            view1.heightAnchor.constraint(equalToConstant: view.frame.size.width/3),
            
            view2.topAnchor.constraint(equalTo: view1.topAnchor),
            view2.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 4),
            view2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            view2.heightAnchor.constraint(equalToConstant: view.frame.size.width/3),
            
            view3.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 8),
            view3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            view3.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -4),
            view3.heightAnchor.constraint(equalToConstant: view.frame.size.width/3),
            
            view4.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 8),
            view4.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 4),
            view4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            view4.heightAnchor.constraint(equalToConstant: view.frame.size.width/3),
            
            view5.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 8),
            view5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            view5.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -4),
            view5.heightAnchor.constraint(equalToConstant: view.frame.size.width/3),
            
            view6.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 8),
            view6.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 4),
            view6.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            view6.heightAnchor.constraint(equalToConstant: view.frame.size.width/3)
        ])
    }
    
}
