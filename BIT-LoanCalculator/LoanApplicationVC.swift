//
//  LoanApplication.swift
//  BIT-LoanCalculator
//
//  Created by Cyril on 10/11/16.
//  Copyright © 2016 cyril. All rights reserved.
//

import Foundation
import UIKit
import Eureka
import PKHUD

class LoanApplicationVC: FormViewController  {
    
    var fullName: TextRow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "dollars")!)
        headerView()
        tableView()
        createFullNameRow()
        createRows()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let _ = fullName.cell.becomeFirstResponder()
        fullName.cell.textField.selectAll(fullName.cell)
    }
    
    fileprivate func createFullNameRow() {
        fullName = TextRow() { cell in
            cell.title = "Full name"
            cell.cellUpdate({ (cell, row) in
                self.update(cell: cell)
                cell.textField.textColor = UIColor.textColor()
                cell.textField.font = UIFont(name: "Avenir-heavy", size: 22)
            })
        }
    }
    
    fileprivate func createRows() {
        form +++ Section("")
            <<< fullName
         +++ Section("")
            <<< DateRow() { cell in
                cell.title = "Birth date"
                cell.cellUpdate({ (cell, row) in
                    self.update(cell: cell)
                    cell.detailTextLabel?.textColor = UIColor.textColor()
                    cell.detailTextLabel?.font = UIFont(name: "Avenir-heavy", size: 22)
                })
        } +++ Section("")
            <<< IntRow() { cell in
                cell.title = "Age"
                cell.cellUpdate({ (cell, row) in
                    self.update(cell: cell)
                    cell.textField.textColor = UIColor.textColor()
                    cell.textField.font = UIFont(name: "Avenir-heavy", size: 22)
                })
        } +++ Section("")
            <<< PhoneRow() { cell in
                cell.title = "Phone num."
                cell.cellUpdate({ (cell, row) in
                    self.update(cell: cell)
                    cell.textField.textColor = UIColor.textColor()
                    cell.textField.font = UIFont(name: "Avenir-heavy", size: 22)
                })
        } +++ Section("")
        
            <<< EmailRow() { cell in
                cell.title = "Email"
                cell.cellUpdate({ (cell, row) in
                    self.update(cell: cell)
                    cell.textField.textColor = UIColor.textColor()
                    cell.textField.font = UIFont(name: "Avenir-heavy", size: 22)
                })
        } +++ Section("")
            <<< TextRow() { cell in
                cell.title = "Street"
                cell.cellUpdate({ (cell, row) in
                    self.update(cell: cell)
                    cell.textField.textColor = UIColor.textColor()
                    cell.textField.font = UIFont(name: "Avenir-heavy", size: 22)
                })
        } +++ Section("")
            
            <<< TextRow() { cell in
                cell.title = "City"
                cell.cellUpdate({ (cell, row) in
                    self.update(cell: cell)
                    cell.textField.textColor = UIColor.textColor()
                    cell.textField.font = UIFont(name: "Avenir-heavy", size: 22)
                })
        } +++ Section("")
            <<< TextRow() { cell in
                cell.title = "Country"
                cell.cellUpdate({ (cell, row) in
                    self.update(cell: cell)
                    cell.textField.textColor = UIColor.textColor()
                    cell.textField.font = UIFont(name: "Avenir-heavy", size: 22)
                })
        }
    }
    
    fileprivate func update(cell: UITableViewCell) {
        cell.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = 25
        cell.tintColor = UIColor.textColor()
        cell.textLabel?.textColor = UIColor.textColor()
        cell.textLabel?.font = UIFont(name: "Avenir-heavy", size: 16)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    fileprivate func tableView() {
        self.tableView!.backgroundColor = UIColor.clear
        self.tableView!.isScrollEnabled = true
        self.tableView!.separatorStyle = .none
        self.tableView!.showsVerticalScrollIndicator = false
        let backGroundView = UIView()
        backGroundView.layer.cornerRadius = 35
        backGroundView.backgroundColor = UIColor.bgColor()
        backGroundView.addSubview(tableView!)
        self.view.addSubview(backGroundView)
        backGroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(80)
            make.left.leading.equalTo(self.view).offset(10)
            make.right.trailing.equalTo(self.view).inset(10)
            make.bottom.equalTo(self.view).inset(30)
        }
        
        self.tableView!.snp.makeConstraints ({ (make) in
            make.top.equalTo(backGroundView)
            make.left.leading.equalTo(backGroundView)
            make.right.trailing.equalTo(backGroundView)
            make.bottom.equalTo(backGroundView)
        })
    }
    
    fileprivate func headerView() {
        let headerView = UIView()
        
        let cancelButton = UIButton()
        cancelButton.setTitle("Back", for: .normal)
        cancelButton.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        cancelButton.setTitleColor(UIColor.textColor(), for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "Avenir-heavy", size: 20)
        cancelButton.titleLabel?.numberOfLines = 1
        cancelButton.titleLabel?.textAlignment = .center
        headerView.backgroundColor = UIColor.bgColor()
        
        let applyButton = UIButton()
        applyButton.setTitle("Apply", for: .normal)
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        applyButton.setTitleColor(UIColor.textColor(), for: .normal)
        applyButton.titleLabel?.font = UIFont(name: "Avenir-heavy", size: 20)
        applyButton.titleLabel?.numberOfLines = 1
        applyButton.titleLabel?.textAlignment = .right
        
        let loanDetail = UILabel()
        loanDetail.text = "Application"
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
            make.height.equalTo(25)
            make.left.leading.equalTo(cancelButton)
            make.right.trailing.equalTo(headerView)
        }
        
        headerView.addSubview(applyButton)
        applyButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view).inset(10)
            make.height.equalTo(loanDetail.snp.height)
            make.top.equalTo(loanDetail.snp.top)
        }
        
    }
    
    @objc func backClicked() {
        let _ = viewControllersStack.popLast()
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func applyButtonTapped() {
        HUD.flash(.success, delay: 1.0) { (completed) in
            if completed {
                let vc = LoanApplied()
                self.present(vc, animated: false, completion: nil)
            }
        }
    }
}
