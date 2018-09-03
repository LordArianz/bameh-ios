//
//  BMItemViewController.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/18/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit
import DeckTransition

class BMItemViewController: UIViewController, DeckTransitionViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var downBtn: UIButton!
    var moreBtn: UIButton!
    var bio: String = "تحصیلات ابتدایی و متوسطهٔ خود را در شهرهای زنجان، کرمان و تهران به پایان رساند. او از کودکی با هنر انس داشت. شعر می‌سرود، داستان و مقاله می‌نوشت و نقاشی می‌کرد." + "\\n" + "به گفته بسیاری از آشنایان و نزدیکان آوینی، او در جوانی متحوّل شد و زندگی او در آغاز دهه ۱۳۴۰ با سال‌های انقلاب فرق بسیار داشت."
    
    override func loadView() {
        super.loadView()
    
        tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        downBtn = UIButton()
        downBtn.backgroundColor = UIColor.clear
        downBtn.setImage(UIImage(named: "ic_down"), for: .normal)

        moreBtn = UIButton()
        moreBtn.backgroundColor = UIColor.clear
        moreBtn.setImage(UIImage(named: "ic_more"), for: .normal)

        self.view.addSubview(tableView)
        self.view.addSubview(downBtn)
        self.view.addSubview(moreBtn)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = self.view.bounds
        downBtn.frame = CGRect(x: (self.view.frame.size.width - 30) / 2, y: 12, width: 30, height: 12)
        moreBtn.frame = CGRect(x: 25, y: 30, width: 5, height: 20)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cnt = 5
        switch indexPath.section {
        case 0:
            return 285
        case 1:
            return CGFloat(cnt * 35 + 10)
        case 2:
            return 200
        case 3:
            return bio.height(withConstrainedWidth: self.view.frame.size.width - 60, font: BMFont.regular(15, isSecondary: true)!) + 120
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        if indexPath.section == 0 {
            var cell: BMItemHeaderTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BMItemHeaderTableViewCell.reuseIdentifier) as? BMItemHeaderTableViewCell
            if cell == nil {
                cell = BMItemHeaderTableViewCell()
            }
            cell?.pictureView.image = UIImage(named: "avini.png")
            return cell!
        } else if indexPath.section == 1 {
            var cell: BMItemInfoTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BMItemInfoTableViewCell.reuseIdentifier) as? BMItemInfoTableViewCell
            if cell == nil {
                cell = BMItemInfoTableViewCell()
            }
            cell?.data =
                ["نام":"سید مرتضی آوینی",
                 "تاریخ تولد":"۱۳۲۶",
                 "محل تولد":"ری",
                 "تاریخ شهادت":"۱۳۷۲",
                 "محل شهادت":"فکه"]
            cell?.tableView.reloadData()
            return cell!
        } else if indexPath.section == 2 {
            var cell: BMItemMediaTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BMItemMediaTableViewCell.reuseIdentifier) as? BMItemMediaTableViewCell
            if cell == nil {
                cell = BMItemMediaTableViewCell()
            }
            cell?.pictureView.image = UIImage(named: "avini1.png")
            return cell!
        } else {
            var cell: BMItemBioTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BMItemBioTableViewCell.reuseIdentifier) as? BMItemBioTableViewCell
            if cell == nil {
                cell = BMItemBioTableViewCell()
            }
            cell?.descLabel.text = bio
            cell?.titleLabel.text = "بیوگرافی:"
            return cell!
        }
    }
    
}

