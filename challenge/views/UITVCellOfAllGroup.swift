//
//  UITVCellOfAllGroup.swift
//  challenge
//
//  Created by Denis Garifyanov on 25/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit

class UITVCellOfAllGroup: UITableViewCell {
    @IBOutlet weak var nameOfGroup: UILabel!
    @IBOutlet weak var imageOfGroup: UIImageView!
    @IBOutlet weak var countOfMembersInGroup: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
