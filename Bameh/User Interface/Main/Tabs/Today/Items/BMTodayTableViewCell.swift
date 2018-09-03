//
//  BMTodayTableViewCell.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/21/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMTodayTableViewCell: UITableViewCell {

    static let reuseIdentifier = "BMTodayTableViewCell"

    var rootView: UIView!
    var bgImageView: UIImageView!
    var infoView: UIView!
    var titleLabel: UILabel!
    var contextLabel: UILabel!
    var dateLabel: UILabel!
    var blurEffectView: UIVisualEffectView!
    
    init() {
        super.init(style: .default, reuseIdentifier: BMOptionTableViewCell.reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        rootView = UIView()
        rootView.backgroundColor = Color.get(.imagePlaceholder)
        rootView.setCorner(radius: 5)
        rootView.clipsToBounds = true
        rootView.layer.borderColor = Color.get(.todayPostBorder).cgColor
        rootView.layer.borderWidth = 1
        
        bgImageView = UIImageView()
        bgImageView.contentMode = .scaleAspectFill
        
        infoView = UIView()
        infoView.backgroundColor = UIColor.clear
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.font = BMFont.medium(14, isSecondary: true)
        titleLabel.textAlignment = .right

        contextLabel = UILabel()
        contextLabel.textColor = Color.get(.black, alpha: 0.55)
        contextLabel.font = BMFont.regular(13, isSecondary: true)
        contextLabel.textAlignment = .right
        //contextLabel.lineBreakMode = .byWordWrapping
        
        dateLabel = UILabel()
        dateLabel.textColor = Color.get(.black, alpha: 0.3)
        dateLabel.font = BMFont.regular(11, isSecondary: true)
        dateLabel.textAlignment = .left

        let blurEffect = UIBlurEffect(style: .extraLight)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //blurEffectView.backgroundColor = Color.get(.white, alpha: 0.8)
        
        infoView.addSubview(blurEffectView)
        infoView.addSubview(titleLabel)
        infoView.addSubview(contextLabel)
        infoView.addSubview(dateLabel)
        rootView.addSubview(bgImageView)
        rootView.addSubview(infoView)
        self.addSubview(rootView)
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
        
        let marginX: CGFloat = 20
        let marginY: CGFloat = 10
        
        rootView.frame = CGRect(x: marginX, y: marginY, width: self.frame.size.width - 2 * marginX, height: self.frame.size.height - 2 * marginY)
        
        bgImageView.frame = rootView.bounds
        infoView.frame = CGRect(x: 0, y: rootView.frame.size.height - 65, width: rootView.frame.size.width, height: 65)
        titleLabel.frame = CGRect(x: 10, y: 10, width: infoView.frame.size.width - 20, height: 24)
        dateLabel.frame = CGRect(x: 10, y: titleLabel.frame.size.height + titleLabel.frame.origin.y + 4, width: 70, height: 17)
        contextLabel.frame = CGRect(x: dateLabel.frame.size.width + dateLabel.frame.origin.x + 10, y: dateLabel.frame.origin.y - 2, width: rootView.frame.size.width - dateLabel.frame.size.width - dateLabel.frame.origin.x - 20, height: 22)
        blurEffectView.frame = infoView.bounds

    }

}
