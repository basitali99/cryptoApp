//
//  BitcoinSecertary.swift
//  BitcoinPrice
//
//  Created by basit ch on 9/15/21.
//

import Foundation

struct BitcoinSecertary{
    
    static var shared = BitcoinSecertary()
    
    func bitcoinSect(url:String, completion: @escaping ([DataModel]?) ->()){
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = Method.Get.rawValue
        NetworkManager.shared.serviceCall(url: request) { data, response , error in
            if error == nil{
                decodeData(dataToDecode: data) { decodedData, error in
                    if error == nil{
                        completion(decodedData)
                    }else{
                        completion(nil)
                        print(String(describing: error))
                    }
                }
            }else{
                completion(nil)
                print(String(describing: error))
            }
        }
    }
}

func decodeData(dataToDecode:Any?, completion: @escaping ([DataModel]?,ErrorTypes?) ->()){
    do{
        let decode = try JSONDecoder().decode([DataModel].self, from: (dataToDecode as! Data))
        DispatchQueue.main.async {
            completion(decode,nil)
        }
    }catch{
        completion(nil,.DecodingError)
    }
}
