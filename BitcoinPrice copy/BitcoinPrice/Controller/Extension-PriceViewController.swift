//
//  Extension-PriceViewController.swift
//  BitcoinPrice
//
//  Created by basit ch on 9/16/21.
//

import UIKit

extension PriceViewController {
    
    func displayImage(url:String) {
        let url = URL(string: url)
        if let imageReq = url{
            let req = URLRequest(url: imageReq)
                self.webImageView.load(req)
        }
    }
}
