//
//  OffersTVC.swift
//  BIT-LoanCalculator
//
//  Created by Cyril on 06/11/16.
//  Copyright © 2016 cyril. All rights reserved.
//

import UIKit
import SnapKit

class OffersTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var loans = [Loan]()
    var months: Int?
    var amount: Int?
    var timeValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerViewSetup()
        tableViewSetup()
        mockData()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "dollars")!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func mockData() {
        let bankNames = ["Allianz","ING bank", "NN", "KB", "Air bank","Equa bank", "Moneta", "Fio bank", "MBank","Zuno", "Citibank"].sorted()
        for i in 0...bankNames.count-1 {
            let rpsn = Double.random(min: 3, max: 6)
            let payment = amount!/months!
            let loan = Loan(bankImage: nil, rpsn: Double.roundTwoDecimals(rpsn), bankName: bankNames[i], numberOfPayments: months!, payment: payment, amount: amount)
            loans.append(loan)
        }
    }
    
    fileprivate func tableViewSetup() {
        self.tableView.backgroundColor = UIColor.clear
        tableView.frame = CGRect(x: 10, y: 90, width: self.view.frame.width-20, height: self.view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LoanCellView", bundle: nil), forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(90, 0, 0, 0))
        }
        
        self.view.addSubview(tableView)
    }
    
    fileprivate func headerViewSetup() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 90))
        headerView.backgroundColor = UIColor.bgColor()
        
        let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 60))
        circleView.layer.cornerRadius = 20
        circleView.clipsToBounds = true
        circleView.backgroundColor = UIColor.textColor()
        
        let cancelButton = UIButton()
        cancelButton.setTitle("New\nsearch", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelClicked), for: .touchUpInside)
        cancelButton.setTitleColor(UIColor.bgColor(), for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "Avenir-heavy", size: 20)
        cancelButton.titleLabel?.numberOfLines = 2
        cancelButton.titleLabel?.textAlignment = .center
        circleView.addSubview(cancelButton)
        headerView.addSubview(circleView)
        
        let priceLabel = UILabel()
        priceLabel.text = "\(amount!) $"
        priceLabel.textAlignment = .left
        priceLabel.layer.cornerRadius = 35.0
        priceLabel.tintColor = UIColor.bgColor()
        priceLabel.backgroundColor = UIColor.bgColor()
        priceLabel.font = UIFont(name: "Avenir-heavy", size: 30)
        priceLabel.textColor = UIColor.textColor()
        headerView.addSubview(priceLabel)
        
        let timeLabel = UILabel()
        timeLabel.text = "for \(timeValue!)"
        timeLabel.textAlignment = .left
        timeLabel.layer.cornerRadius = 35.0
        timeLabel.tintColor = UIColor.bgColor()
        timeLabel.backgroundColor = UIColor.bgColor()
        timeLabel.font = UIFont(name: "Avenir-heavy", size: 22)
        timeLabel.textColor = UIColor.textColor()
        timeLabel.addSubview(priceLabel)
        headerView.addSubview(timeLabel)
        self.view.addSubview(headerView)
        
        
        circleView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(25)
            make.width.equalTo(120)
            make.right.trailing.equalTo(view).inset(10)
            make.height.equalTo(60)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(30)
            make.left.leading.equalTo(view).offset(15)
            make.right.trailing.equalTo(view).inset(150)
            make.height.equalTo(25)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(priceLabel).offset(30)
            make.left.equalTo(priceLabel)
            make.right.trailing.equalTo(priceLabel)
            make.height.equalTo(priceLabel)
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.top.equalTo(circleView).offset(10)
            make.right.trailing.equalTo(circleView)
            make.left.leading.equalTo(circleView)
            make.height.equalTo(35)
        }
        return view
    }
    
    @objc func cancelClicked() {
        let _ = viewControllersStack.popLast()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LoanCell
        let loan = loans[indexPath.section]
        cell.frame = CGRect(x: 15, y: 0, width: self.view.frame.width-30, height: 70)
        cell.bankName.text = loan.bankName
        cell.bankImage.image = loan.bankImage
        cell.rpsn.text = "RPSN: \(loan.rpsn!)"
        cell.totalCost.text = "\(loan.numberOfPayments!) x \(loan.payment!) $"
        cell.bankImage.image = UIImage(named: "bank")
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return loans.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LoanDetailVC()
        vc.loan =  loans[indexPath.section]
        viewControllersStack.append(vc)
        self.present(vc, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

extension Double {
    public static func random(min: Double, max: Double) -> Double {
        return Double(arc4random())/Double(UInt32.max) + (max - min)
    }
    
    public static func roundTwoDecimals(_ number: Double ) -> Double {
        let num = (number*100.0).rounded(FloatingPointRoundingRule.down)
        return num/100
    }
    
}
