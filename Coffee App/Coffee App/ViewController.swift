//  ViewController.swift
//  Coffee App
//  Software Developer: Denis J Finkel
//  Created by Student on 6/18/19.
//  Copyright © 2019 Student. All rights reserved.
//
import UIKit
//
class ViewController: UIViewController {
    // * Public Instance Variables *
    let BASE_PRICE = 2.50
    let MILK_PRICE = 0.50
    let ICE_PRICE = 0.30
    let SUGAR_PRICE = 1.00
    let DECAF_PRICE = 0.80
    var customersTotalPrice = 0.00
    var baseOrder = "Coffee"
    //
    // * Lists *
    var prices = [0.0]
    var orders = ["0.0"]
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var orderLabel: UILabel!
    // Switchers
    @IBOutlet weak var switch_Milk: UISwitch!
    @IBOutlet weak var switch_Ice: UISwitch!
    @IBOutlet weak var switch_Sugar: UISwitch!
    @IBOutlet weak var switch_Decaf: UISwitch!
    // Stack View
    @IBOutlet weak var cupStack: UIStackView!
    
     // Button - Add Cup
    @IBAction func btn_AddCup(_ sender: UIButton) {
        let cupImage = UIImageView(image:UIImage(named: "RedCup"))
        cupImage.contentMode = .scaleAspectFit
        UIView.animate(withDuration: 0.75) {
            self.cupStack.addArrangedSubview(cupImage)
            self.cupStack.layoutIfNeeded()
            if(self.switch_Milk.isOn){
                self.customersTotalPrice += self.BASE_PRICE+self.MILK_PRICE
                self.baseOrder += ", Milk"
            }
            if(self.switch_Ice.isOn){
                self.customersTotalPrice += self.BASE_PRICE+self.ICE_PRICE
                self.baseOrder += ", Ice"
            }
            if(self.switch_Sugar.isOn){
                self.customersTotalPrice += self.BASE_PRICE+self.SUGAR_PRICE
                self.baseOrder += ", Sugar"
            }
            if(self.switch_Decaf.isOn){
                self.customersTotalPrice += self.BASE_PRICE+self.DECAF_PRICE
                self.baseOrder += ", Decaf"
            }
        }
        self.prices+=[self.customersTotalPrice]
        self.orders+=[self.baseOrder]
        self.orderLabel.text = ""
        for index in 0 ... self.orders.count - 1 {
            let message = self.orders[index] + String.init(format: "$ %.2f", prices[index])
            self.orderLabel.text?.append(message)
        }
    }
    
     // Button - Remove Cup
    @IBAction func btn_RemoveCup(_ sender: UIButton) {
        let lastCupAdded = self.cupStack.arrangedSubviews.last
        if let cup = lastCupAdded{
            UIView.animate(withDuration: 0.25) {
                // Removes Cup Animation
                self.cupStack.removeArrangedSubview(cup)
                cup.removeFromSuperview()
                self.cupStack.layoutIfNeeded()
                self.orderLabel.text? = ""
            }
        }
        let lastIndex = self.orders.count - 1
        self.orders.remove(at:lastIndex)
        self.prices.remove(at:lastIndex)
        orderLabel.text? = ""
        if(orders.count > 0){
            for index in 0 ... self.orders.count - 1 {
                let message = self.orders[index] + String.init(format: "$ %.2f", prices[index])
                self.orderLabel.text?.append(message)
            }
        }
    }// END OF FUNCTION
        // Button - Done
    @IBAction func btn_Done(_ sender: UIButton) {
     var grandTotal = 0.0
         for index in  self.prices {
            grandTotal+=index
            orderLabel.text?.append("Total"+String(format:"%2.f",grandTotal))
        }
    }
    
    
}// END OF CLASS

