//
//  UITabBarControllerRepresentable.swift
//  
//
//  Created by Niccolò Fontana on 19/01/23.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

@available(iOS 13.0, *)
struct UITabBarControllerRepresentable: UIViewControllerRepresentable {
    let selectedTabIndex: Int
    let controlledViews: [UIViewController]
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(controlledViews, animated: false)
        tabBarController.selectedIndex = selectedTabIndex
        tabBarController.tabBar.isHidden = true
        if #available(iOS 18.0, *) {
            tabBarController.isTabBarHidden = true
        }
        return tabBarController
    }
    
    func updateUIViewController(_ tabBarController: UITabBarController, context: Context) {
        UIView.setAnimationsEnabled(false)
        tabBarController.selectedIndex = selectedTabIndex
        UIView.setAnimationsEnabled(true)
    }
}

@available(iOS 13.0, *)
struct TabBarController_Previews: PreviewProvider {
    static var previews: some View {
        UITabBarControllerRepresentable(selectedTabIndex: 0, controlledViews: [])
    }
}
#endif
