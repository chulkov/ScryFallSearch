//
//  ViewController.swift
//  ScryFallSearch
//
//  Created by Max on 20/02/2020.
//  Copyright © 2020 chulkov. All rights reserved.
//

import UIKit
import Nuke

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var cards = Card(){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.isHidden = false
                self.greetingsLabel.isHidden = true
            }
        }
    }
    
    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.estimatedRowHeight = 161.0
            tableView.rowHeight = UITableView.automaticDimension
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            searchBar.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableViewCells()
    }
    
    
    
    // MARK: SearchBar Delegates
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, !text.isEmpty{
            NetworkRequest().searchCards(text: text) { result in
                switch result {
                case .failure(let error):
                    print(error)
                    self.showAlert(withTitle: "Error", withMessage: "No data exists with this request")
                    
                case .success(let cards):
                    self.cards = cards
                }
            }
            
        }else{
            //print("Search request shouldn't be empty")
            showAlert(withTitle: "Error", withMessage: "Search request shouldn't be empty")
        }
        
    }
    
    
    // MARK: TableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards?.data.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as? CardCell{
            cell.nameLabel.text = cards?.data[indexPath.row].name
            cell.typeLabel.text = cards?.data[indexPath.row].typeLine
            cell.oracleIDLabel.text = cards?.data[indexPath.row].oracleText
            
            if let imageUrl = cards?.data[indexPath.row].imageUris?.small{
                Nuke.loadImage(with: imageUrl , into: cell.cardImage)
            }
            if (indexPath.row % 2 == 0)
                   {
                       cell.backgroundColor = #colorLiteral(red: 0.1242478415, green: 0.1237513795, blue: 0.1071277484, alpha: 1)
                   } else {
                       cell.backgroundColor = #colorLiteral(red: 0.1960217427, green: 0.1956617534, blue: 0.1736101083, alpha: 1)
                   }
            return cell
        }
        return UITableViewCell()
    }
    
    func registerTableViewCells(){
        let customCell = UINib(nibName: "CardCell", bundle: nil)
        self.tableView.register(customCell, forCellReuseIdentifier: "CardCell")
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }

}

extension  UIViewController {

    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
