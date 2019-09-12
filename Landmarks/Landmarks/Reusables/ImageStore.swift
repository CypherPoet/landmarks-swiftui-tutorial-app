//
//  Reusables.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/11/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation


final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    var images: _ImageDictionary = [:]
    
    private static var scale = 2
    static var shared = ImageStore()
}


extension ImageStore {
    
    func image(named name: String) -> Image {
        let scale = CGFloat(ImageStore.scale)
        let label = Text(verbatim: name)
        
        if let foundImage = images[name] {
            return Image(foundImage, scale: scale, label: label)
        }
        
        let loadedImage = ImageStore.loadImage(named: name)
        images[name] = loadedImage
        
        return Image(loadedImage, scale: scale, label: label)
    }
    
    
    static func loadImage(named name: String) -> CGImage {
        guard
            let imageURL = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(imageURL as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        
        return image
    }
}
