//
//  LoanVC.swift
//  BIT-LoanCalculator
//
//  Created by Cyril on 06/11/16.
//  Copyright © 2016 cyril. All rights reserved.
//

import UIKit
import SnapKit
import Eureka

extension UIColor {
    
    class func bgColor() -> UIColor {
        return UIColor(red: 0.957, green: 0.957, blue: 0.886, alpha: 1.00)
    }
    
    class func textColor() -> UIColor{
        return UIColor(red: 0.278, green: 0.631, blue: 0.471, alpha: 1.00)
    }
    
}


class LoanVC: UIViewController, UITextFieldDelegate {
    
    let priceField = UITextField()
    let slider = MySlider()
    let timeLabel = UILabel()
    let submitButton = UIButton()
    let bgColor = UIColor(red: 0.957, green: 0.957, blue: 0.886, alpha: 1.00)
    let textColor = UIColor(red: 0.278, green: 0.631, blue: 0.471, alpha: 1.00)
    let monthValues = [1,3,6,12,24,32,44,60,120,180,240]
    let timeValues = ["1 month",
                      "3 months",
                      "6 months",
                      "1 year",
                      "2 years",
                      "3 years",
                      "4 years",
                      "5 years",
                      "10 years",
                      "15 years",
                      "20 years"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView(frame: self.view.frame)
        self.view = view
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "dollars")!)
        priceFieldSetup()
        timeLabelSetup()
        sliderSetup()
        submitButtonSetup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Memory warning...")
    }
    
    fileprivate func sliderSetup() {
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.tintColor = textColor
        self.view.addSubview(slider)
        
        //Gestures
        slider.addTarget(self, action: #selector(sliderMoved), for: .valueChanged )
        
        //Constraints
        slider.snp.makeConstraints { (make) in
            make.right.equalTo(priceField)
            make.left.equalTo(priceField)
            make.height.equalTo(30)
            make.top.equalTo(priceField).offset(150)
        }
        
    }
    
    fileprivate func priceFieldSetup() {
        //Init
        priceField.layer.cornerRadius = 35.0
        priceField.delegate = self
        priceField.placeholder = "Amount"
        priceField.tintColor = textColor
        priceField.backgroundColor = bgColor
        priceField.keyboardType = .numberPad
        priceField.becomeFirstResponder()
        priceField.updateFloatingCursor(at: CGPoint(x: priceField.frame.width/2, y: 30))
        priceField.font = UIFont(name: "Avenir-heavy", size: 40)
        priceField.tintColor = bgColor
        priceField.textColor = textColor
        priceField.textAlignment = .center
        priceField.text = ""
        self.view.addSubview(priceField)
        
        //Gestures
        self.view.addGestureRecognizer(hideKeyboardGestureRecognizer())
        self.slider.addGestureRecognizer(hideKeyboardGestureRecognizer())
        
        //Constraints
        priceField.snp.makeConstraints { (make) in
            make.height.equalTo(70)
            make.top.equalTo(self.view).offset(50)
            let tfSideOffset = 40
            make.left.equalTo(0).offset(tfSideOffset)
            make.right.trailing.equalTo(self.view).inset(tfSideOffset)
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = textField.text?.replacingOccurrences(of: "$", with: "")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text!.characters.count > 0 {
            textField.text?.append("$")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (priceField.text?.characters.count)! > 7 && range.length == 0 {
            return false
        }
        return true
    }

    fileprivate func timeLabelSetup() {
        let labelBgView = UIView()
        labelBgView.layer.cornerRadius = 20
        labelBgView.backgroundColor = bgColor
        
        timeLabel.font = UIFont(name: "Avenir-heavy", size: 30)
        timeLabel.textAlignment = .center
        timeLabel.text = timeValues.first
        timeLabel.textColor = textColor
        labelBgView.addSubview(timeLabel)
        self.view.addSubview(labelBgView)
        
        labelBgView.snp.makeConstraints { (make) in
            make.height.equalTo(45)
            make.top.equalTo(priceField).offset(80)
            make.left.equalTo(self.view).offset(40)
            make.right.trailing.equalTo(self.view).inset(40)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(priceField).offset(85)
            make.left.equalTo(labelBgView)
            make.right.trailing.equalTo(labelBgView)
            make.height.equalTo(35)
        }
    }
    
    fileprivate func submitButtonSetup() {
        submitButton.layer.cornerRadius = 35.0
        submitButton.setTitle("Search", for: .normal)
        submitButton.titleLabel?.font = UIFont(name: "Avenir-heavy", size: 35)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        submitButton.backgroundColor = bgColor
        submitButton.titleColor(for: .normal)
        submitButton.setTitleColor(textColor, for: .normal)
        
        self.view.addSubview(submitButton)
        
        submitButton.snp.makeConstraints { (make) in
            make.top.equalTo(slider).offset(30)
            make.left.equalTo(self.view).offset(10)
            make.right.trailing.equalTo(self.view).inset(10)
            make.height.equalTo(70)
        }
    }
    
    @objc func submitButtonTapped() {
        let amount = priceField.text!.replacingOccurrences(of: "$", with: "")
        if priceField.text!.characters.count > 0 {
            let vc = OffersTVC()
            vc.amount = Int(amount)
            vc.months = monthValues[Int(slider.value)]
            vc.timeValue = timeValues[Int(slider.value)]
            viewControllersStack.append(vc)
            self.show(vc, sender: self)
        } else {
            let alert = UIAlertController.init(title: "Amount cannot be clear.", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            })
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func sliderMoved() {
        timeLabel.text = timeValues[Int(slider.value)]
        dismissKeyboard()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        priceField.resignFirstResponder()
    }
    
    fileprivate func hideKeyboardGestureRecognizer() -> UITapGestureRecognizer {
        let touchOutside = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        touchOutside.numberOfTapsRequired = 1
        touchOutside.numberOfTouchesRequired = 1
        return touchOutside
    }
    
    
}

class MySlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        //keeps original origin and width, changes height, you get the idea
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 20.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }
}

