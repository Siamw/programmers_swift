//
//  Money.swift
//  MoneyConverter
//
//  Created by lecture on 2018. 4. 15..
//  Copyright © 2018년 lecture. All rights reserved.
//

import Foundation

enum Currency:Int{
    case USD = 0, KRW, JPY, EUR //row value로 정수값을 가진다. USD가 0이라면, KRW는 1, ...
    
    var ratio:Double{
        get{
            switch self{
            case .USD : return 1.0
            case .KRW : return 1178.5
            case .JPY : return 122.45
            case .EUR : return 0.92
            }
        }
    }
    var symbol:String{
        get{
            switch self{
            case .USD : return "$"
            case .KRW : return "₩"
            case .JPY : return "Y"
            case .EUR : return "E"
            }
        } //computed property 생성
    }
}
struct Money{
    var usdollar = 0.0
    
    init(_ _usdollar:Double) {// '_ '를 넣어서 생성시 매개변수 이름을 쓰지 않아도 되도록 설정
            usdollar = _usdollar
    }
    init(moneyInKRW:Double){
        usdollar = moneyInKRW * 0.00085
    }
}

let myMoney = Money(120)
let incomeInKRW = Money(moneyInKRW: 350_000)//35만원을 넣어줌

