//
//  BMViewController.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/15/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMViewController: UIViewController, UITextFieldDelegate {
    
    private var _bgImgeView: UIImageView?
    
    var searchBar: UIView?
    var filterBtn: UIButton?
    var searchField: UITextField?
    var searchImg: UIImageView?
    var cancelBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = String.localized("BM.Navigation.Back")
        backButton.setTitleTextAttributes([NSAttributedStringKey.font: BMFont.regular(15)!], for: UIControlState.normal)
        self.navigationItem.backBarButtonItem = backButton
        self.view.backgroundColor = Color.get(.vcBackground)
    }
    
    func setSearchBar(_ placeholder: String) {
        if let nav: BMNavigationController = self.navigationController as! BMNavigationController? {
            self.searchBar = UIView()
            self.searchBar?.backgroundColor = Color.get(.searchBarBackground)
            self.searchBar?.setCorner(radius: 10)
            self.searchBar?.clipsToBounds = true
            
            self.filterBtn = UIButton()
            self.filterBtn?.setImage(UIImage(named: "ic_filter"), for: .normal)
            
            self.searchField = UITextField()
            self.searchField?.font = BMFont.regular(17)
            self.searchField?.textAlignment = .right
            self.setAttributedPlaceholder(placeholder: placeholder, alignment: .center, textField: self.searchField!)
            self.searchField?.tintColor = UIColor.black
            self.searchField?.delegate = self
            self.searchField?.returnKeyType = .search
            self.searchField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            self.searchImg = UIImageView()
            self.searchImg?.image = UIImage(named: "ic_search")
            
            self.cancelBtn = UIButton()
            self.cancelBtn?.setTitle(String.localized("BM.Search.Cancel"), for: .normal)
            self.cancelBtn?.setTitleColor(UIColor.black, for: .normal)
            self.cancelBtn?.titleLabel?.font = BMFont.regular(17)
            self.cancelBtn?.alpha = 0
            
            self.searchBar?.addSubview(self.filterBtn!)
            self.searchBar?.addSubview(self.searchField!)
            self.searchBar?.addSubview(self.searchImg!)
            self.searchBar?.addSubview(self.cancelBtn!)
            
            let marginX: CGFloat = 15
            let marginY: CGFloat = 5
            
            self.searchBar?.frame = CGRect(x: marginX, y: marginY, width: nav.navigationBar.frame.size.width - 2 * marginX, height: nav.navigationBar.frame.size.height - 2 * marginY)
            
            self.filterBtn?.frame = CGRect(x: (self.searchBar?.frame.size.width)! - 10 - 18, y: ((self.searchBar?.frame.size.height)! - 12) / 2, width: 18, height: 12)
            
            let fieldMarginX: CGFloat = (self.searchBar?.frame.size.width)! - (self.filterBtn?.frame.origin.x)! + 10
            self.searchField?.frame = CGRect(x: fieldMarginX, y: 3, width: (self.searchBar?.frame.size.width)! - 2 * fieldMarginX, height: (self.searchBar?.frame.size.height)! - 6)
            
            let placeholderWidth: CGFloat = placeholder.width(withConstrainedHeight:(self.searchField?.frame.size.height)!, font: (self.searchField?.font!)!)
            self.searchImg?.frame = CGRect(x: ((self.searchBar?.frame.size.width)! - placeholderWidth) / 2 - 10 - 15, y: ((self.searchBar?.frame.size.height)! - 15) / 2, width: 15, height: 15)
            self.cancelBtn?.frame = CGRect(x: 5, y: 0, width: 0, height: 0)
            self.cancelBtn?.sizeToFit()
            
            self.navigationItem.titleView = self.searchBar
        }
    }
    
    func setAttributedTitle(_ title: String){
        if let nav: BMNavigationController = self.navigationController as! BMNavigationController? {
            let label: UILabel = UILabel()
            label.text = title
            label.font = nav.titleFont
            label.textColor = nav.titleColor
            label.sizeToFit()
            label.adjustsFontSizeToFitWidth = true
            self.navigationItem.titleView = label
            nav.view.tintColor = UIColor.black
        }
    }
    
    func changeTitle(_ title: String) {
        
        if let label: UILabel = self.navigationItem.titleView as? UILabel {
            label.text = title
        }
    }
    
    func setImageBackground(_ name: String) {
        let background = UIImage(named: name)
        _bgImgeView = UIImageView()
        _bgImgeView?.contentMode =  UIViewContentMode.scaleAspectFill
        _bgImgeView?.clipsToBounds = true
        _bgImgeView?.image = background
        _bgImgeView?.center = view.center
        view.addSubview(_bgImgeView!)
        self.view.sendSubview(toBack: _bgImgeView!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        _bgImgeView?.frame = self.view.bounds
        
    }
    
    func setRightItem(_ title: String){
        let add = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightButtonAction))
        add.tintColor = UIColor.white
        add.setTitleTextAttributes([NSAttributedStringKey.font: BMFont.regular(15)!], for: UIControlState.normal)
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = add
    }
    
    func setRightItem(_ title: String, isImage: Bool){
        if isImage {
            let add = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightButtonAction))
            add.tintColor = UIColor.white
            add.image = UIImage(named: title)
            self.navigationController?.navigationBar.topItem?.rightBarButtonItem = add
        } else {
            setRightItem(title)
        }
    }
    
    func setLeftItem(_ title: String){
        let add = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(leftButtonAction))
        add.tintColor = UIColor.white
        add.setTitleTextAttributes([NSAttributedStringKey.font: BMFont.regular(15)!], for: UIControlState.normal)
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = add
    }
    
    func setLeftItem(_ title: String, isImage: Bool){
        if isImage {
            let add = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(leftButtonAction))
            add.tintColor = UIColor.white
            add.image = UIImage(named: title)
            self.navigationController?.navigationBar.topItem?.leftBarButtonItem = add
        } else {
            setRightItem(title)
        }
    }
    
    // Delegates
    
    @objc func rightButtonAction(_ sender: Any) {
        print("PARENT")
    }
    
    @objc func leftButtonAction(_ sender: Any) {
        print("PARENT-LEFT")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let str: String = textField.text {
            if !str.isEmpty {
                self.cancelBtn?.alpha = 1
            } else {
                self.cancelBtn?.alpha = 0
            }
        }
    }
    
    func setAttributedPlaceholder(placeholder: String, alignment: NSTextAlignment, textField: UITextField) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.paragraphStyle: paragraphStyle,                                                                                             NSAttributedStringKey.foregroundColor: Color.get(.searchFieldPlaceholder, alpha: 0.3)])
        textField.attributedPlaceholder = attributedPlaceholder
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.searchImg?.alpha = 0

        if let str: String = textField.text {
            if str.isEmpty {
                self.setAttributedPlaceholder(placeholder: textField.placeholder!, alignment: .right, textField: textField)
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let str: String = textField.text {
            if str.isEmpty {
                self.searchImg?.alpha = 1
                self.setAttributedPlaceholder(placeholder: textField.placeholder!, alignment: .center, textField: textField)
            }
        } else {
            self.searchImg?.alpha = 1
            print("STR NIL")
            self.setAttributedPlaceholder(placeholder: textField.placeholder!, alignment: .center, textField: textField)
        }
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

