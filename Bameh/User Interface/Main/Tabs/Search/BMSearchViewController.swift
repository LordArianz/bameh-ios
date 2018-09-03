//
//  BMSearchViewController.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/16/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMSearchViewController: BMViewController {

    var infoLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        
        infoLabel = UILabel()
        infoLabel.font = BMFont.regular(15)
        infoLabel.textAlignment = .center
        infoLabel.textColor = Color.get(.textLight)
        infoLabel.text = String.localized("BM.Tab.Search.info")
        
        self.view.addSubview(infoLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSearchBar(String.localized("BM.Tab.Search.Title"))
        self.hideKeyboardWhenTappedAround()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        infoLabel.frame = CGRect(x: 0, y: (self.view.frame.size.height - 30) / 2, width: self.view.frame.size.width, height: 30)
    }
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        super.textFieldDidBeginEditing(textField)
        infoLabel.alpha = 0
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        super.textFieldDidEndEditing(textField)
        infoLabel.alpha = 1
    }
}
