//
//  PageControl.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/17/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import UIKit


struct PageControl: UIViewRepresentable {
    typealias UIViewType = UIPageControl
    
    var numberOfPages: Int
    @Binding var currentPage: Int
}


extension PageControl {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {
        let pageControl = UIPageControl()
        
        pageControl.numberOfPages = numberOfPages
        
        pageControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        
        return pageControl
    }
    

    func updateUIView(_ pageControl: UIPageControl, context: UIViewRepresentableContext<PageControl>) {
        pageControl.currentPage = currentPage
    }
}

// MARK: - Coordinator
extension PageControl {
    
    class Coordinator: NSObject {
        var pageControl: PageControl
        
        init(_ pageControl: PageControl) {
            self.pageControl = pageControl
        }
        
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            pageControl.currentPage = sender.currentPage
        }
    }
}
