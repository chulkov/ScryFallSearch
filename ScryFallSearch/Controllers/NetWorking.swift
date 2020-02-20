//
//  NetWorking.swift
//  ScryFallSearch
//
//  Created by Max on 20/02/2020.
//  Copyright © 2020 chulkov. All rights reserved.
//

import Foundation


enum HandleError: Error{
    case noDataAvailable
    case canNotProcessData
}

struct NetworkRequest {
    
    let baseURL = "https://api.scryfall.com/"
    
    init() {
        
    }

    func searchCards(text:String, compleation: @escaping(Result<Card, HandleError>) ->Void) {
        
        let destinationURL = baseURL + "cards/search?q=\(text)"
        let urlString = destinationURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let resourceURL = URL(string: urlString!) else {fatalError()}

        print("\(resourceURL)")

        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            
            guard let jsonData = data else {
                compleation(.failure(.noDataAvailable))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let cards = try decoder.decode(Card.self, from: jsonData)
                compleation(.success(cards))
            }catch{
                print(error.localizedDescription)
                compleation(.failure(.canNotProcessData))
            }
            
        }
        dataTask.resume()
    }

}
