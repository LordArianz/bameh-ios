//
//  BMItemHeaderTableViewCell.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/18/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

class BMItemHeaderTableViewCell: UITableViewCell {

    static let reuseIdentifier = "BMItemHeaderTableViewCell"
    
    var pictureView: UIImageView!
    
    init() {
        super.init(style: .default, reuseIdentifier: BMItemHeaderTableViewCell.reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        pictureView = UIImageView()
        pictureView.setCorner(radius: 5)
        pictureView.contentMode = .scaleAspectFill
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
        let side: CGFloat = 215
        pictureView.frame.size = CGSize(width: side, height: side)
        pictureView.center = self.center
    }
}
