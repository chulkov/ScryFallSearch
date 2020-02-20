//
//  CardCell.swift
//  ScryFallSearch
//
//  Created by Max on 20/02/2020.
//  Copyright © 2020 chulkov. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {


    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var oracleIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
