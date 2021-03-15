//
//  CryptoViewModel.swift
//  LearnMvvmCryptoMoney
//
//  Created by Sakir Bayram on 12.03.2021.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
    
   
}


struct CryptoViewModel {
    let crytpoCurrency: CryptoCurrency
    
}




extension CryptoListViewModel {
    
    func numberOfRowsInSection() -> Int {
         return self.cryptoCurrencyList.count
     }
     
     func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
         let crypto = self.cryptoCurrencyList[index]
         return CryptoViewModel(crytpoCurrency: crypto)
     }
}


extension CryptoViewModel {

    var name: String {
        return self.crytpoCurrency.currency
    }
    
    var price: String {
        return self.crytpoCurrency.price
    }

    
}
