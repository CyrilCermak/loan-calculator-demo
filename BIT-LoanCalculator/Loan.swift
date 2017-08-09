//
//  Loan.swift
//  BIT-LoanCalculator
//
//  Created by Cyril on 06/11/16.
//  Copyright © 2016 cyril. All rights reserved.
//

import Foundation
import UIKit

struct Loan {
    
    var totalCost: Double?
    var rpsn: Double?
    var bankName: String?
    var bankImage: UIImage?
    var numberOfPayments: Int?
    var payment: Int?
    var amount: Int?
    
    init(bankImage: UIImage?, rpsn: Double?, bankName: String?, numberOfPayments: Int, payment: Int?, amount: Int?) {
        self.bankImage = bankImage
        self.amount = amount
        self.rpsn = rpsn
        self.bankName = bankName
        self.numberOfPayments = numberOfPayments
        self.payment = payment
        self.totalCost = Double.roundTwoDecimals(countTotalCost())
    }
    
    fileprivate func countTotalCost() -> Double {
        return ((Double(amount!)/100) * rpsn!) + Double(amount!)
    }
    
}
