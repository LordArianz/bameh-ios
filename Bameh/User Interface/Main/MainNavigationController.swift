//
//  MainNavigationController.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/16/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class MainNavigationController: BMNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleFont = BMFont.regular(17)
        self.titleColor = UIColor.black
        self.view.backgroundColor = Color.get(.mainBackground)
        
        self.navigationBar.backgroundColor = Color.get(.mainBackground)
        self.navigationBar.setShadow(0, offset: CGSize(width: 0, height: 0))
        self.navigationBar.isTranslucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
