//
//  UICCPhoto.swift
//  challenge
//
//  Created by Denis Garifyanov on 25/06/2018.
//  Copyright © 2018 Denis Garifyanov. All rights reserved.
//

import UIKit

class UICCPhoto: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    
    func setByListOfPhoto (_ ph: ModelPhoto){
        self.photo.kf.setImage(with: URL(string: ph.url))
    }
}
