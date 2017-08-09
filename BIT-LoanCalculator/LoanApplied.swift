//
//  LoanApplied.swift
//  BIT-LoanCalculator
//
//  Created by Cyril on 11/11/16.
//  Copyright © 2016 cyril. All rights reserved.
//

import Foundation
import UIKit

class LoanApplied: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "dollars")!)
        initHeaderView()
        initContentView()
    }
    
    fileprivate func initHeaderView() {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.bgColor()
        
        let doneButton = UIButton()
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        doneButton.setTitleColor(UIColor.textColor(), for: .normal)
        doneButton.titleLabel?.font = UIFont(name: "Avenir-heavy", size: 20)
        doneButton.titleLabel?.numberOfLines = 1
        doneButton.titleLabel?.textAlignment = .right
        
        let loanDetail = UILabel()
        loanDetail.text = "Success"
        loanDetail.textColor = UIColor.textColor()
        loanDetail.font = UIFont(name: "Avenir-heavy", size: 24)
        loanDetail.numberOfLines = 1
        loanDetail.textAlignment = .center
        
        self.view.addSubview(headerView)
        
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.leading.equalTo(self.view)
            make.right.trailing.equalTo(self.view)
            make.height.equalTo(66)
        }
        
        headerView.addSubview(loanDetail)
        loanDetail.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(25)
            make.height.equalTo(25)
            make.left.leading.equalTo(self.view)
            make.right.trailing.equalTo(headerView)
        }
        
        headerView.addSubview(doneButton)
        doneButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).inset(10)
            make.height.equalTo(loanDetail.snp.height)
            make.top.equalTo(loanDetail.snp.top)
        }
        
    }
    
    fileprivate func initContentView() {
        let backGroundView = UIView()
        backGroundView.layer.cornerRadius = 35
        backGroundView.backgroundColor = UIColor.bgColor()
        self.view.addSubview(backGroundView)
        let textLabel = UILabel()
        textLabel.text = "You have successfully applied!"
        textLabel.numberOfLines = 3
        textLabel.font = UIFont(name: "Avenir-heavy", size: 40)
        textLabel.textColor = UIColor.textColor()
        textLabel.textAlignment = .center
        backGroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.left.leading.equalTo(self.view).offset(10)
            make.right.trailing.equalTo(self.view).inset(10)
            make.bottom.equalTo(self.view).inset(60)
        }
        backGroundView.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(backGroundView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
            make.top.equalTo(backGroundView.snp.top)
        }
    }
    
    
    @objc func doneButtonTapped() {
        let searchVC = LoanVC()
        self.present(searchVC, animated: false, completion: nil)
    }
    
}
