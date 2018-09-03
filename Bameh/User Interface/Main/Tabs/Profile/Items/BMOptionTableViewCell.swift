//
//  BMOptionTableViewCell.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/19/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMOptionTableViewCell: UITableViewCell {

    static let reuseIdentifier = "BMOptionTableViewCell"
    
    var titleLabel: UILabel!
    var rootView: UIView!
    var btn: UIButton!
    var openImg: UIImageView!
    var switchBtn: UISwitch!
    var topicLabel: UILabel!
    var descLabel: UILabel!
    
    init() {
        super.init(style: .default, reuseIdentifier: BMOptionTableViewCell.reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        topicLabel = UILabel()
        topicLabel.font = BMFont.regular(13)
        topicLabel.textColor = Color.get(.profileOptionTopic)
        topicLabel.textAlignment = .right

        rootView = UIView()
        rootView.backgroundColor = UIColor.white
        
        titleLabel = UILabel()
        titleLabel.font = BMFont.regular(15)
        titleLabel.textColor = Color.get(.profileOptionTitle)
        titleLabel.textAlignment = .right
        
        openImg = UIImageView()
        openImg.image = UIImage(named: "ic_arrow_left")
        
        switchBtn = UISwitch()
        switchBtn.alpha = 0
        
        descLabel = UILabel()
        descLabel.font = BMFont.regular(12)
        descLabel.textColor = Color.get(.profileOptionTopic)
        descLabel.textAlignment = .right
        descLabel.numberOfLines = 0

        rootView.addSubview(titleLabel)
        rootView.addSubview(openImg)
        rootView.addSubview(switchBtn)
        self.addSubview(topicLabel)
        self.addSubview(rootView)
        self.addSubview(descLabel)
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
        
        topicLabel.frame = CGRect(x: 0, y: 10, width: self.frame.size.width - 15, height: 30)
        rootView.frame = CGRect(x: 0, y: topicLabel.frame.size.height + topicLabel.frame.origin.y, width: self.frame.size.width, height: 45)
        titleLabel.frame = CGRect(x: 0, y: 10, width: rootView.frame.size.width - 15, height: 30)
        openImg.frame = CGRect(x: 15, y: 15, width: 8, height: 13)
        switchBtn.frame.origin = CGPoint(x: 15, y: 7)
        descLabel.frame = CGRect(x: 15, y: rootView.frame.size.height + rootView.frame.origin.y + 10, width: self.frame.size.width - 30, height: self.frame.size.height - 20 - rootView.frame.size.height - rootView.frame.origin.y)

    }
}
