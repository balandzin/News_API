//
//  CustomButton.swift
//  IndependentlyGB
//
//  Created by Антон Баландин on 6.02.24.
//

import UIKit

final class CustomButton: UIButton {
    
    init(withText text: String) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 18)
        backgroundColor = .blue
        setTitleColor(.white, for: .normal)
        setTitleColor(.green, for: .highlighted)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
