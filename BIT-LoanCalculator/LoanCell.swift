//
//  LoanCell.swift
//  BIT-LoanCalculator
//
//  Created by Cyril on 06/11/16.
//  Copyright © 2016 cyril. All rights reserved.
//

import UIKit

class LoanCell: UITableViewCell {

    @IBOutlet var bankImage: UIImageView!
    @IBOutlet var bankName: UILabel!
    @IBOutlet var rpsn: UILabel!
    @IBOutlet var totalCost: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.bgColor()
        self.layer.cornerRadius = 30.0
        rpsn.textAlignment = .right
        totalCost.textAlignment = .center
        totalCost.font = UIFont(name: "Avenir-heavy", size: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
