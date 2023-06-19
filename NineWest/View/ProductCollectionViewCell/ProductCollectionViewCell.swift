//
//  ProductCollectionViewCell.swift
//  NineWest
//
//  Created by macbook pro on 18.06.2023.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var prodImageView: UIImageView!
    @IBOutlet var prodRateLabel: UILabel!
    @IBOutlet var prodNameLabel: UILabel!
    @IBOutlet var prodPriceLabel: UILabel!
    @IBOutlet var favoriteButton: UIButton!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prodImageView.image = UIImage(systemName: "camera")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Hücre özelleştirmelerini burada yapabilirsiniz
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @IBAction func didTappedFavoriteButton(_ sender: Any) {
        
    }
    
}
