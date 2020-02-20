//
//  ViewController.swift
//  ScryFallSearch
//
//  Created by Max on 20/02/2020.
//  Copyright © 2020 chulkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var cards = Card(){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            searchBar.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 161.0
        tableView.rowHeight = UITableView.automaticDimension
        registerTableViewCells()
    }
    
    
    
    // MARK: SearchBar Protocols
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text{
            NetworkRequest().searchCards(text: text) { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let cards):
                    self.cards = cards
                }
            }
            
        }
        
    }
    
    
    // MARK: TableView Protocols
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (cards?.data.count ?? 1)
        return cards?.data.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as? CardCell{
            cell.nameLabel.text = cards?.data[indexPath.row].name
            cell.typeLabel.text = cards?.data[indexPath.row].typeLine
            cell.oracleIDLabel.text = cards?.data[indexPath.row].oracleID
            
            if let imageUrl = cards?.data[indexPath.row].imageUris?.small{
                let url = URL(string: imageUrl)

                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        cell.cardImage.image = UIImage(data: data!)
                    }
                }
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func registerTableViewCells(){
        let customCell = UINib(nibName: "CardCell", bundle: nil)
        self.tableView.register(customCell, forCellReuseIdentifier: "CardCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

