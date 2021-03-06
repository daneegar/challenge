//
//  UITVCellOfMyGroup.swift
//  challenge
//
//  Created by Denis Garifyanov on 25/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit
import Kingfisher

class UITVCellOfMyGroup: UITableViewCell {
    @IBOutlet weak var nameOfGroup: UILabel!
    @IBOutlet weak var imageOfGroup: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWithData (_ group: ModelGroup){
        nameOfGroup.text = group.name
        imageOfGroup.kf.setImage(with: URL(string: group.photoUrl!))
    }

}
