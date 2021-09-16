//
//  priceControllerViewController.swift
//  BitcoinPrice
//
//  Created by basit ch on 9/15/21.
//

import UIKit

class priceControllerViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    
    var priceOfbtc : DataModel?
    var networkTimer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performNetworkRequets()
        
        networkTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(repeatNetwork), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func repeatNetwork(){
        performNetworkRequets()
    }
    
    
    
    func performNetworkRequets(){
        BitcoinSecertary.shared.bitcoinSect(url: url.api.rawValue) { dataRecieved, Error in
            if Error == nil{
                if let data = dataRecieved{
                    self.priceOfbtc = data.first
                    if let price = self.priceOfbtc{
                        self.priceLabel.text = "\(price.price)$"
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

