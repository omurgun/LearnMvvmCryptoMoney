//
//  ViewController.swift
//  LearnMvvmCryptoMoney
//
//  Created by Sakir Bayram on 12.03.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel :CryptoListViewModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        getData()
        
    }
    
    
    private func getData(){
        
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
             
             Webservice().downloadCurrencies(url: url) { cryptos in
                 
                 if let cryptos = cryptos {
                     
                    self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                     
                 }
             }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        
        
        return cell
        
    }
    


}

