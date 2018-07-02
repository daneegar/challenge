//
//  UITVCellOfAllGroup.swift
//  challenge
//
//  Created by Denis Garifyanov on 25/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit
import Kingfisher

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
    func setupWithModel (byTheGroup group: ModelGroup){
        self.nameOfGroup.text = group.name
        self.imageOfGroup.kf.setImage(with: URL(string: group.photoUrl!))
        self.countOfMembersInGroup.text = group.membersCount
    }
}
