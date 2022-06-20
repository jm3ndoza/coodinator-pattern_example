//
//  NavigationController.swift
//  Coordinator_UIKit
//
//  Created by Jeremiah Mendoza on 20/06/2022.
//

import UIKit

class NavigationController: UINavigationController {

	override init(rootViewController: UIViewController) {
		super.init(rootViewController: rootViewController)
		let textColor = UIColor(named: "TabBarSelectedColor")!
		
		navigationBar.titleTextAttributes = [
			NSAttributedString.Key.foregroundColor: textColor,
			NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)
		]
		
		navigationBar.tintColor = textColor
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
