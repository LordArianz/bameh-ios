//
//  RootTabBarController.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/16/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import AVFoundation
import QRCodeReader

class RootTabBarController: UITabBarController {
    
    init(){
        super.init(nibName: nil, bundle: nil)

        let vc1 = MainNavigationController(rootViewController: BMSearchViewController())
        let vc2 = MainNavigationController(rootViewController: BMMapViewController())
        let vc3 = MainNavigationController(rootViewController: BMQRViewController())
        let vc4 = MainNavigationController(rootViewController: BMTodayViewController())
        let vc5 = MainNavigationController(rootViewController: BMProfileViewController())
        
        vc1.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "tab_search")?.withRenderingMode(.alwaysTemplate), selectedImage: nil)
        vc2.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "tab_map")?.withRenderingMode(.alwaysTemplate), selectedImage: nil)
        vc3.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "tab_qr")?.withRenderingMode(.alwaysTemplate), selectedImage: nil)
        vc4.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "tab_today")?.withRenderingMode(.alwaysTemplate), selectedImage: nil)
        vc5.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "tab_profile")?.withRenderingMode(.alwaysTemplate), selectedImage: nil)
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        vc3.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        vc4.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        vc5.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        viewControllers = [vc1, vc2, vc3, vc4, vc5]
        setViewControllers(viewControllers, animated: true)
        
        tabBar.isTranslucent = false
        
        tabBar.backgroundImage = UIImage.image(with: Color.get(.tabBarBackground))
        
        if #available(iOS 10.0, *) {
            //            UITabBarItem.appearance().setBadgeTextAttributes([NSAttributedStringKey.font.rawValue: KCFont.regular(12, isSecondary: true)!,
            //                                                              NSAttributedStringKey.foregroundColor.rawValue: UIColor.white,
            //                                                              NSAttributedStringKey.baselineOffset.rawValue: -2], for: .normal)
            if #available(iOS 11.0, *) {
                UITabBarItem.appearance().setBadgeTextAttributes([NSAttributedStringKey.font.rawValue: BMFont.regular(12, isSecondary: true)!], for: .normal)
            } else {
                UITabBarItem.appearance().setBadgeTextAttributes([NSAttributedStringKey.baselineOffset.rawValue: -2,
                                                                  NSAttributedStringKey.font.rawValue: BMFont.regular(12, isSecondary: true)!], for: .normal)
            }
            
            //UITabBarItem.appearance().badgeColor = Color.get(.badgeColor)
            
            tabBar.tintColor = Color.get(.tabBarSelected)
            tabBar.unselectedItemTintColor = Color.get(.tabBarDeselected)
        } else {
            tabBar.selectedImageTintColor = Color.get(.tabBarSelected)
            tabBar.tintColor = Color.get(.tabBarDeselected)
        }
        
        RootTabBarCtrl = self
    }
    
    var freshLaunch = true
    override func viewWillAppear(_ animated: Bool) {
        if freshLaunch == true {
            freshLaunch = false
            self.selectedIndex = 2
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func logUser() {
        //Crashlytics.sharedInstance().setUserIdentifier(UserData.phone)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.get(.mainBackground)
        
        logUser()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
