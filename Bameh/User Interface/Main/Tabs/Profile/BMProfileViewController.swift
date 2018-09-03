//
//  BMProfileViewController.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/16/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMProfileViewController: BMViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var infoView: UIView!
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var phoneLabel: UILabel!
    var editBtn: UIButton!
    var version: UILabel!
    
    var notice: String = "در صورت خروج از حساب کاربری قادر به دسترسی به تنظیمات این بخش نخواهید بود."
    
    override func loadView() {
        super.loadView()
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.bounces = false
        
        infoView = UIView()
        infoView.backgroundColor = UIColor.white
        
        imageView = UIImageView()
        imageView.backgroundColor = Color.get(.imagePlaceholder)
        imageView.image = UIImage(named: "user_image.png")
        imageView.clipsToBounds = true
        
        nameLabel = UILabel()
        nameLabel.textColor = UIColor.black
        nameLabel.font = BMFont.regular(14)
        nameLabel.textAlignment = .right
        nameLabel.text = "محسن هانی"
        
        phoneLabel = UILabel()
        phoneLabel.textColor = Color.get(.phoneNumber)
        phoneLabel.font = BMFont.regular(12, isSecondary: true)
        phoneLabel.textAlignment = .right
        phoneLabel.text = "+98 913 451 2383"
        
        editBtn = UIButton()
        editBtn.setTitle("ویرایش", for: .normal)
        editBtn.titleLabel?.font = BMFont.medium(13)
        editBtn.setTitleColor(Color.get(.editBtn), for: .normal)
        editBtn.backgroundColor = UIColor.clear
        
        version = UILabel()
        version.font = BMFont.regular(13, isSecondary: true)
        version.textColor = Color.get(.version)
        version.textAlignment = .center
        let str: String = Bundle.main.versionNumber!
        version.text = "نسخه " + str

        infoView.addSubview(imageView)
        infoView.addSubview(nameLabel)
        infoView.addSubview(phoneLabel)
        infoView.addSubview(editBtn)
        self.view.addSubview(infoView)
        self.view.addSubview(tableView)
        self.view.addSubview(version)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAttributedTitle(String.localized("BM.Tab.Profile.Title"))

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        infoView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 65)
        tableView.frame = CGRect(x: 0, y: infoView.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height - infoView.frame.size.height)
        
        imageView.frame = CGRect(x: infoView.frame.size.width - 20 - 55, y: 5, width: 55, height: 55)
        imageView.setCorner(radius: imageView.frame.size.height / 2)
        
        editBtn.frame = CGRect(x: 15, y: 20, width: 40, height: 20)
        nameLabel.frame = CGRect(x: editBtn.frame.size.width + editBtn.frame.origin.x + 5, y: 10, width: imageView.frame.origin.x - 15 - editBtn.frame.size.width - editBtn.frame.origin.x, height: 25)
        phoneLabel.frame = CGRect(x: nameLabel.frame.origin.x, y: nameLabel.frame.origin.y + nameLabel.frame.size.height, width: nameLabel.frame.size.width, height: 20)
        version.frame = CGRect(x: 0, y: self.view.frame.size.height - 30, width: self.view.frame.size.width, height: 30)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85 + (indexPath.row == 2 ? 20 + notice.height(withConstrainedWidth: self.view.frame.size.width - 30, font: BMFont.regular(12)!) : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: BMOptionTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BMOptionTableViewCell.reuseIdentifier) as? BMOptionTableViewCell
        if cell == nil {
            cell = BMOptionTableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell?.topicLabel.text = "زبان"
            cell?.titleLabel.text = "فارسی"
            cell?.switchBtn.alpha = 0
        case 1:
            cell?.topicLabel.text = "نقشه"
            cell?.titleLabel.text = "دریافت اعلان هنگام رسیدن به مقصد"
            cell?.switchBtn.alpha = 1
        case 2:
            cell?.topicLabel.text = ""
            cell?.titleLabel.text = "خروج"
            cell?.titleLabel.textColor = Color.get(.profileOptionRed)
            cell?.switchBtn.alpha = 0
            cell?.descLabel.text = notice
        default:
            break
        }
        
        return cell!
    }
}

