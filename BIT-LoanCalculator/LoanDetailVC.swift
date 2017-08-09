//
//  LoanDetail.swift
//  BIT-LoanCalculator
//
//  Created by Cyril on 08/11/16.
//  Copyright © 2016 cyril. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class LoanDetailVC: UIViewController, UIScrollViewDelegate {
    
    var loan: Loan?
    var detailView: LoanDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        self.view.addSubview(view)
        
        self.view.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.leading.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.right.trailing.equalTo(self.view)
        }
        self.view = view
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "dollars")!)
        addBackButton()
        addDetailView()
        addApplyButton()
    }
    
    fileprivate func addDetailView() {
        detailView = Bundle.main.loadNibNamed( "LoanDetailView", owner: LoanDetailView.self, options: nil)!.first as! LoanDetailView
        detailView.backgroundColor = UIColor.bgColor()
        detailView.layer.cornerRadius = 40.0
        detailView.setup(loan: loan!)
        
        self.view.addSubview(detailView)
        
        detailView.snp.makeConstraints { (make) in
            make.left.leading.equalTo(self.view).offset(20)
            make.right.trailing.equalTo(self.view).inset(20)
            make.top.equalTo(self.view).offset(100)
            make.height.equalTo(250)
        }
    }
    
    fileprivate func addBackButton() {
        let headerView = UIView()
        
        let cancelButton = UIButton()
        cancelButton.setTitle("Back", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelClicked), for: .touchUpInside)
        cancelButton.setTitleColor(UIColor.textColor(), for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "Avenir-heavy", size: 20)
        cancelButton.titleLabel?.numberOfLines = 1
        cancelButton.titleLabel?.textAlignment = .center
        headerView.backgroundColor = UIColor.bgColor()
        
        let loanDetail = UILabel()
        loanDetail.text = "Loan Application"
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
        
        headerView.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(25)
            make.left.equalTo(headerView).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
        
        headerView.addSubview(loanDetail)
        loanDetail.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(25)
            make.width.equalTo(50)
            make.height.equalTo(25)
            make.left.leading.equalTo(cancelButton)
            make.right.trailing.equalTo(headerView)
        }
    }
    
    fileprivate func addApplyButton() {
        let applyButton = UIButton()
        applyButton.layer.cornerRadius = 35.0
        applyButton.setTitle("Apply for loan", for: .normal)
        applyButton.titleLabel?.font = UIFont(name: "Avenir-heavy", size: 35)
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        applyButton.backgroundColor = UIColor.bgColor()
        applyButton.titleColor(for: .normal)
        applyButton.setTitleColor(UIColor.textColor(), for: .normal)
        
        self.view.addSubview(applyButton)
        applyButton.snp.makeConstraints { (make) in
            make.top.equalTo(detailView).offset(detailView.frame.height+50)
            make.left.equalTo(detailView)
            make.right.trailing.equalTo(detailView)
            make.height.equalTo(70)
        }
    }
    
    @objc func applyButtonTapped() {
        let vc = LoanApplicationVC()
        viewControllersStack.append(vc)
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc func cancelClicked() {
        let _ = viewControllersStack.popLast()
        self.dismiss(animated: true, completion: nil)
    }
    
}
