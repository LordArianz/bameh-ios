//
//  SmoothScroll.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/15/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func reloadDataSmoothly() {
        UIView.setAnimationsEnabled(false)
        CATransaction.begin()
        
        CATransaction.setCompletionBlock { () -> Void in
            UIView.setAnimationsEnabled(true)
        }
        
        reloadData()
        beginUpdates()
        endUpdates()
        
        CATransaction.commit()
    }
}

extension UICollectionView {
    func reloadDataSmoothly() {
        UIView.setAnimationsEnabled(false)
        CATransaction.begin()
        
        CATransaction.setCompletionBlock { () -> Void in
            UIView.setAnimationsEnabled(true)
        }
        
    
        performBatchUpdates({
            reloadData()
        }) { (success) in
        }
        CATransaction.commit()

    }
}
