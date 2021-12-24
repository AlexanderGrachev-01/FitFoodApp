//
//  FoodTableViewCell.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 24.12.2021.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodKcalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
