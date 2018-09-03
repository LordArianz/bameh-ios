//
//  BMItemInfoTableViewCell.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/18/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMItemInfoTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    static let reuseIdentifier = "BMItemInfoTableViewCell"
    
    var tableView: UITableView!
    var data: [String: String]?
    
    init() {
        super.init(style: .default, reuseIdentifier: BMItemInfoTableViewCell.reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        self.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.frame = CGRect(x: 30, y: 0, width: self.frame.size.width - 60, height: self.frame.size.height - 10)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: BMInfoTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BMInfoTableViewCell.reuseIdentifier) as? BMInfoTableViewCell
        if cell == nil {
            cell = BMInfoTableViewCell()
        }
        if data != nil {
            let key = Array(data!.keys)[(data?.count)! - indexPath.row - 1]
            let value = data![key]
            cell?.keyLabel.text = key
            cell?.valueLabel.text = value
        }
        return cell!
    }
}
