//
//  RootNavigationController.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/16/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class RootNavigationController: BMNavigationController {

    var loadingVC: UIViewController!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .default
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleFont = BMFont.regular(17)
        self.titleColor = UIColor.black
        self.view.backgroundColor = Color.get(.mainBackground)
        
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black,
                                                             .font: BMFont.regular(16)!],
                                                            for: [.normal, .highlighted])
        
        self.navigationBar.isHidden = true
        
        
//        loadingVC = UINib(nibName: "LaunchScreen", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIViewController
//        self.viewControllers = [loadingVC]

        RootTabBarCtrl = RootTabBarController()
        self.viewControllers = [RootTabBarCtrl]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
