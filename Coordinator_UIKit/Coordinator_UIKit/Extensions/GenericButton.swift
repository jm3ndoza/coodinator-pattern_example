//
//  GenericButton.swift
//  Coordinator_UIKit
//
//  Created by Jeremiah Mendoza on 20/06/2022.
//

import UIKit

class GenericButton: UIButton {
	
	enum Style {
		case primary
		case secondary
	}
	
	init(style: GenericButton.Style) {
		super.init(frame: .zero)
		
		titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
		
		layer.cornerRadius = 5
		clipsToBounds = true
		
		switch style {
		case .primary:
			backgroundColor = UIColor(named: "PrimaryButtonColor")
		case .secondary:
			backgroundColor = UIColor(named: "SecondaryButtonColor")
		}
		
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
