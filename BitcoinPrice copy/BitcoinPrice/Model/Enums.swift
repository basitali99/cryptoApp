//
//  Enums.swift
//  BitcoinPrice
//
//  Created by basit ch on 9/15/21.
//

import Foundation

enum ErrorTypes : Error{
    case DecodingError
    case NetworkingError
}

enum LoginDetails : String{
    case UserName = "basit123"
    case Password = "123456"
}

enum ViewController : String{
    case SecondScreen = "vc2"
}

enum Method : String{
    case Get = "Get"
}

enum Url : String{
    case Api = "https://api.nomics.com/v1/currencies/ticker?key=5e3a2a23d96dcdd5978032f2f7a3ab4558854f3f&ids=BTC"
}




