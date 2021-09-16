//
//  priceControllerViewController.swift
//  BitcoinPrice
//
//  Created by basit ch on 9/15/21.
//

import UIKit
import WebKit

class PriceViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var webImageView: WKWebView!
    
    var infoOfBTC : DataModel?
    var repeatNetwork : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performNetworkRequest()
        repeatNetwork = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(performRequest), userInfo: nil, repeats: true)
    }
    
    @objc func performRequest(){
        performNetworkRequest()
    }
    
    func performNetworkRequest(){
        BitcoinSecertary.shared.bitcoinSect(url: Url.Api.rawValue) { dataRecieved in
            if let data = dataRecieved{
                self.infoOfBTC = data.first
                if let info = self.infoOfBTC{
                    self.priceLabel.text = "\(info.price) $"
                    DispatchQueue.main.async {
                        self.displayImage(url: info.logo_url)
                    }
                }
            }
        }
    }
}
