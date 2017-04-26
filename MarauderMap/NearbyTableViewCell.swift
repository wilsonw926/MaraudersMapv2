//
//  NearbyTableViewCell.swift
//  MarauderMap
//
//  Created by JC Dy on 4/25/17.
//  Copyright © 2017 Wilson Wang. All rights reserved.
//

import UIKit

class NearbyTableViewCell: UITableViewCell {

    @IBOutlet weak var nearbyPic: UIImageView!
    @IBOutlet weak var nearbyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
