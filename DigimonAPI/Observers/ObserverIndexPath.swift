//
//  ObserverIndexPath.swift
//  DigimonAPI
//
//  Created by user220831 on 1/10/23.
//

import Foundation
import UIKit

final class ObserverIndexPath {
    
    static var index: Int?
    
    lazy var observerIndexPath = { [weak self] (index: Int) -> () in
        return ObserverIndexPath.index = index
    }
}

