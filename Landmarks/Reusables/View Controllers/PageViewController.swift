//
//  PageViewController.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/17/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import UIKit


struct PageViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIPageViewController
    typealias Context = UIViewControllerRepresentableContext<PageViewController>
    
    var controllers: [UIViewController]


    func makeUIViewController(context: Context) -> UIPageViewController {
        UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
    }
    
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([controllers[0]], direction: .forward, animated: true)
    }
}
