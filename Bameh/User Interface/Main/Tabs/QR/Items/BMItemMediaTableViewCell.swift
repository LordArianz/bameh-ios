//
//  BMItemMediaTableViewCell.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/18/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMItemMediaTableViewCell: UITableViewCell {

    static let reuseIdentifier = "BMItemMediaTableViewCell"
    
    var pictureView: UIImageView!
    
    init() {
        super.init(style: .default, reuseIdentifier: BMItemMediaTableViewCell.reuseIdentifier)
        self.backgroundColor = UIColor.clear
     
        pictureView = UIImageView()
        pictureView.setCorner(radius: 5)
        pictureView.contentMode = .scaleAspectFit
        pictureView.clipsToBounds = true
        self.addSubview(pictureView)
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
        pictureView.frame.size = CGSize(width: self.frame.width - 60, height: self.frame.size.height)
        pictureView.center = self.center
        print(pictureView.frame)
    }
}
