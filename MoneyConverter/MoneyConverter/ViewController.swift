//
//  ViewController.swift
//  MoneyConverter
//
//  Created by lecture on 2018. 4. 15..
//  Copyright © 2018년 lecture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencySegment: UISegmentedControl!
    @IBOutlet weak var sourceMoneyField: UITextField!
    @IBOutlet weak var targetMoneyLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertMoney(_ sender: Any) {
        
        //if let은 괄호 안으로 코드가 계속 들어가는 반면
        //guard let을 사용하면 else를 같이 붙여서 예외처리만 하면 된다.
        guard let sourceCurrency = Currency(rawValue: currencySegment.selectedSegmentIndex) else{
            print("Source Currency Error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else{
            targetMoneyLable.text = "Error"
            return
        }
        let sourceMoney = Money(sourceAmount, currency: sourceCurrency)
        
       /* let ratio : Double
        switch currencySegment.selectedSegmentIndex{
        case 0:
            ratio = 0.00085
        case 1:
            ratio = 1178.5
        default:
            ratio = 1.0
        }*/
        
        var targetMoneyString=""//모든 화폐에 대해 다 해야히기 때문에 var
        
        for i in 0..<4 //swift3 부터 표현방법이 바뀜
            {//화폐단위 각각에대해 만들어짐.
                targetMoneyString += sourceMoney.valueInCurrency(currency:Currency.init(rawValue: i)!)
            targetMoneyString += "\r\n"
            }
       /*
        if let sourceMoney = Double(sourceMoneyField.text!)
        {
            targetMoneyString="\(sourceMoney * ratio)"
        }
        else {targetMoneyString = "Error"}
        */
        targetMoneyLable.text=targetMoneyString
    }
    
}

