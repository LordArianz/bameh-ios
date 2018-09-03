//
//  BMTodayViewController.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/16/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMTodayViewController: BMViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!

    override func loadView() {
        super.loadView()
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0)
        //tableView.setShadow(1, offset: CGSize(width: 1, height: 1))
        
        self.view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAttributedTitle(String.localized("BM.Tab.Today.Title"))
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 215
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: BMTodayTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BMTodayTableViewCell.reuseIdentifier) as? BMTodayTableViewCell
        if cell == nil {
            cell = BMTodayTableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell?.bgImageView.image = UIImage(named: "avini2.png")
            cell?.titleLabel.text = "سالروز شهادت سید مرتضی آوینی"
            cell?.contextLabel.text = "تحصیلات ابتدایی و متوسطهٔ خود را در شهرها …"
            cell?.dateLabel.text = "۱ دقیقه پیش"
        case 1:
            cell?.bgImageView.image = UIImage(named: "roshan.png")
            cell?.titleLabel.text = "سالروز تولد مصطفی احمدی روشن"
            cell?.contextLabel.text = "در روستای سنگستان استان همدان متولد شد …"
            cell?.dateLabel.text = "۲ ساعت پیش"
        case 2:
            cell?.bgImageView.image = UIImage(named: "mooze.png")
            cell?.titleLabel.text = "۳۰ امین سالگرد موزه ملی ایران"
            cell?.contextLabel.text = "موزه ایران باستان دارای مجموعه‌های غنی از …"
            cell?.dateLabel.text = "۴ روز پیش"
        default:
            break
        }
        
        return cell!
    }

}

