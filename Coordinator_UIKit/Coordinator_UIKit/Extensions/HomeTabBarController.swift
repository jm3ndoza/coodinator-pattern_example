//
//  HomeTabBarController.swift
//  Coordinator_UIKit
//
//  Created by Jeremiah Mendoza on 20/06/2022.
//

import UIKit

class HomeTabBarController: UITabBarController {

	init() {
		super.init(nibName: nil, bundle: nil)
		
		tabBar.backgroundColor = UIColor(named: "BackgroundColor")
		
		let unselectedColor = UIColor(named: "TabBarUnselectedColor")!
		let selectedColor = UIColor(named: "TabBarSelectedColor")!
		
		tabBar.unselectedItemTintColor = unselectedColor
		tabBar.tintColor = selectedColor
		tabBar.isTranslucent = false
		
		modalTransitionStyle = .crossDissolve
		modalPresentationStyle = .overCurrentContext
		navigationItem.hidesBackButton = true
		
		let font = UIFont.systemFont(ofSize: 12, weight: .medium)
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}	
}
