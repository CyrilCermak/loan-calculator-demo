//
//  LoanCell.swift
//  BIT-LoanCalculator
//
//  Created by Cyril on 06/11/16.
//  Copyright © 2016 cyril. All rights reserved.
//

import UIKit

class LoanDetailCell: UITableViewCell {
    
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    fileprivate func loadView() {
        infoLabel = UILabel()
        infoLabel.text = "4 years"
        infoLabel.textAlignment = .left
        infoLabel.layer.cornerRadius = 35.0
        infoLabel.tintColor = UIColor.bgColor()
        infoLabel.backgroundColor = UIColor.bgColor()
        infoLabel.font = UIFont(name: "Avenir-heavy", size: 22)
        infoLabel.textColor = UIColor.textColor()
        self.contentView.addSubview(infoLabel)
        
        valueLabel = UILabel()
        valueLabel.text = "4 years"
        valueLabel.textAlignment = .left
        valueLabel.layer.cornerRadius = 35.0
        valueLabel.tintColor = UIColor.bgColor()
        valueLabel.backgroundColor = UIColor.bgColor()
        valueLabel.font = UIFont(name: "Avenir-heavy", size: 22)
        valueLabel.textColor = UIColor.textColor()
        self.contentView.addSubview(valueLabel)
        
        infoLabel.snp.makeConstraints { (make) in
            make.left.leading.equalTo(self.contentView).offset(20)
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.right.leading.equalTo(self.contentView).inset(20)
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
    }
    
}
