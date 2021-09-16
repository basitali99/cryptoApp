//
//  priceControllerViewController.swift
//  BitcoinPrice
//
//  Created by basit ch on 9/15/21.
//

import UIKit

class priceControllerViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    var priceOfBtc : DataModel?
    var repeatTimer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performNetworkRequest()
        
        repeatTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(repeatNetwork), userInfo: nil, repeats: true)
        }
    
    
    @objc func repeatNetwork(){
        performNetworkRequest()
        print("yes")
    }
    
    
    
    
    func performNetworkRequest(){
        BitcoinSecertary.shared.bitcoinSect(url: url.api.rawValue) { dataRecieved, Error in
            if Error == nil{
                if let data = dataRecieved{
                    self.priceOfBtc = data.first
                    if let price = self.priceOfBtc{
                        self.priceLabel.text = "\(price.price) $"
                    }
                }
            }else{
                if let error = Error{
                    print(error)
                }
            }
        }
    }
    
    
}
