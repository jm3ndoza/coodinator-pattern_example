//
//  Spacer.swift
//  Coordinator_UIKit
//
//  Created by Jeremiah Mendoza on 20/06/2022.
//

import Foundation
import UIKit

class Spacer: UIView {
	
	init(width: CGFloat) {
		super.init(frame: .zero)
		
		let constraint = widthAnchor.constraint(equalToConstant: width)
		constraint.priority = .defaultHigh
		
		NSLayoutConstraint.activate([
			constraint
		])
	}
	
	init(height: CGFloat) {
		super.init(frame: .zero)
		
		let constraint = heightAnchor.constraint(equalToConstant: height)
		constraint.priority = .defaultHigh
		NSLayoutConstraint.activate([
			constraint
		])
	}
	
	init() {
		super.init(frame: .zero)
		
		setContentHuggingPriority(.defaultLow, for: .horizontal)
		setContentHuggingPriority(.defaultLow, for: .vertical)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

