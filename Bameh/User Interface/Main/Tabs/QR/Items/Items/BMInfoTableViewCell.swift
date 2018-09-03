//
//  BMInfoTableViewCell.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/19/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMInfoTableViewCell: UITableViewCell {

    static let reuseIdentifier = "BMInfoTableViewCell"

    var keyLabel: UILabel!
    var valueLabel: UILabel!
    
    init() {
        super.init(style: .default, reuseIdentifier: BMInfoTableViewCell.reuseIdentifier)
        self.backgroundColor = UIColor.white

        keyLabel = UILabel()
        keyLabel.font = BMFont.regular(15)
        keyLabel.textColor = Color.get(.black, alpha: 0.5)
        keyLabel.textAlignment = .right

        valueLabel = UILabel()
        valueLabel.font = BMFont.regular(15)
        valueLabel.textColor = Color.get(.black)
        valueLabel.textAlignment = .left
        
        self.addSubview(valueLabel)
        self.addSubview(keyLabel)
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
        
        keyLabel.frame = CGRect(x: self.frame.size.width / 2, y: 0, width: self.frame.size.width / 2, height: 25)
        valueLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width / 2, height: 25)
        
    }

}
