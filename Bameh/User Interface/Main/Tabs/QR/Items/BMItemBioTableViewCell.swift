//
//  BMItemBioTableViewCell.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/18/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMItemBioTableViewCell: UITableViewCell {

    static let reuseIdentifier = "BMItemBioTableViewCell"
    
    var titleLabel: UILabel!
    var descLabel: UITextView!
    
    init() {
        super.init(style: .default, reuseIdentifier: BMItemBioTableViewCell.reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        titleLabel = UILabel()
        titleLabel.font = BMFont.regular(15)
        titleLabel.textColor = Color.get(.black, alpha: 0.5)
        titleLabel.textAlignment = .right
        
        descLabel = UITextView()
        descLabel.textColor = UIColor.black
        descLabel.font = BMFont.regular(15, isSecondary: true)
        descLabel.textAlignment = .right
        descLabel.isScrollEnabled = false
        descLabel.isEditable = false
        descLabel.backgroundColor = UIColor.clear
        descLabel.bounces = false

        self.addSubview(titleLabel)
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
        
        let margin: CGFloat = 30
        titleLabel.frame = CGRect(x: margin, y: margin, width: self.frame.size.width - 2 * margin, height: 30)
        descLabel.frame = CGRect(x: margin, y: titleLabel.frame.size.height + titleLabel.frame.origin.y, width: titleLabel.frame.size.width, height: self.frame.size.height - 2 * margin - titleLabel.frame.size.height)
    }

}
