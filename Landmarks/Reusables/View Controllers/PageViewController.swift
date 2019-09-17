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
}


extension PageViewController {

    // SwiftUI calls this `makeCoordinator()` method before `makeUIViewController(context:)`,
    // so that you have access to the coordinator object when configuring your view controller.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([controllers[0]], direction: .forward, animated: true)
    }
}


// MARK: - Coordinator
extension PageViewController {
    
    // SwiftUI manages our `UIViewControllerRepresentable` type’s coordinator,
    // and provides it as part of the context when calling the methods you created above.
    //
    // We can use this coordinator to implement common Cocoa patterns,
    // such as delegates, data sources, and responding to user events via target-action.
    class Coordinator: NSObject {
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
    }
}


extension PageViewController.Coordinator: UIPageViewControllerDataSource {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let index = parent.controllers.firstIndex(of: viewController) else { return nil }
        
        if index == 0 {
            return parent.controllers.last
        } else {
            return parent.controllers[index - 1]
        }
    }
    
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let index = parent.controllers.firstIndex(of: viewController) else { return nil }
        
        if index == parent.controllers.count - 1 {
            return parent.controllers.first
        } else {
            return parent.controllers[index + 1]
        }
    }
}
