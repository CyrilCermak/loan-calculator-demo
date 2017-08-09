//
//  LoanDetailView.swift
//  BIT-LoanCalculator
//
//  Created by Cyril on 09/11/16.
//  Copyright © 2016 cyril. All rights reserved.
//

import Foundation
import UIKit

class LoanDetailView: UIView {
   
    @IBOutlet var payment: UILabel!
    @IBOutlet var paymentValue: UILabel!
    @IBOutlet var numOfPaym: UILabel!
    @IBOutlet var numOfPaymValue: UILabel!
    @IBOutlet var mngmnFees: UILabel!
    @IBOutlet var mngmntFees: UILabel!
    @IBOutlet var earlyRepay: UILabel!
    @IBOutlet var earlyRepayValue: UILabel!
    @IBOutlet var interestRate: UILabel!
    @IBOutlet var interestRateValue: UILabel!
    @IBOutlet var rpsn: UILabel!
    @IBOutlet var rpsnValue: UILabel!
    @IBOutlet var totalCost: UILabel!
    @IBOutlet var totalCostValue: UILabel!
    
    var values: [UILabel]?
    var infos: [UILabel]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        values = [paymentValue,numOfPaymValue,mngmntFees,earlyRepayValue,interestRateValue,rpsnValue,totalCostValue]
        infos = [payment,numOfPaym,mngmnFees,earlyRepay,interestRate,rpsn,totalCost]
        for value in values! {
            setUpValue(label: value)
        }
        for info in infos! {
            setUpInfo(label: info)
        }
    }
    
    func setup(loan: Loan) {
        self.paymentValue.text = "\(loan.payment!)$"
        self.numOfPaymValue.text = "\(loan.numberOfPayments!)$"
        self.mngmntFees.text = "0$"
        self.earlyRepayValue.text = "0$"
        self.interestRateValue.text = "10.9%"
        self.rpsnValue.text = "\(loan.rpsn!)%"
        self.totalCostValue.text = "\(loan.totalCost!)$"
    }
    
    fileprivate func setUpValue(label: UILabel) {
        label.textAlignment = .right
        label.textColor = UIColor.textColor()
        label.font = UIFont(name: "Avenir-heavy", size: 22)
        
    }
    
    fileprivate func setUpInfo(label: UILabel) {
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-heavy", size: 16)
    }
    
}
