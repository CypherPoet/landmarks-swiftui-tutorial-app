//
//  Range+Magnitude.swift
//  Landmarks
//
//  Created by Brian Sipple on 9/14/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation


extension Range where Bound: Numeric {
    
    var magnitude: Bound {
        self.upperBound - self.lowerBound
    }
}
