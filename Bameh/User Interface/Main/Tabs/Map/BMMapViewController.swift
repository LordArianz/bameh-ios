//
//  BMMapViewController.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/16/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMMapViewController: BMViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSearchBar(String.localized("BM.Tab.Map.Title"))
        self.hideKeyboardWhenTappedAround()
        self.setImageBackground("map_test.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
