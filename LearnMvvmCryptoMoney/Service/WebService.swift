//
//  WebService.swift
//  LearnMvvmCryptoMoney
//
//  Created by Sakir Bayram on 12.03.2021.
//

import Foundation


class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                
                let crytpoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
            
                
                if let cryptos = crytpoList {
                    completion(cryptos)
                }
                
            }
            
        }.resume()
        
    }
    
}
