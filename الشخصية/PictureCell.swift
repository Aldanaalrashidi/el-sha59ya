//
//  PictureCell.swift
//  الشخصية
//
//  Created by Aldana Al Rashidi on 25/11/2020.
//

import UIKit

class PictureCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var imageName:String?
    
    func loadContent() {
        if imageName == nil { return }
        if let image = UIImage(named:imageName!) {
            imageView.image = image
        }
        
        layer.cornerRadius = 30
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3.5
    }

}
