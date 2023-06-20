//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by STARK on 22.05.2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLbl.text = category.title
        categoryImageView.kf.setImage(with: category.image?.asUrl)
        print("Debug: \(category.title)----\(category.image)")
    }
}
