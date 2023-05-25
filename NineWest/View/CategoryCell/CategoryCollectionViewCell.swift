//
//  CategoryCollectionViewCell.swift
//  NineWest
//
//  Created by macbook pro on 21.05.2023.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCell"
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.backgroundColor = .clear
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Başlık etiketini hücreye ekle
        addSubview(titleLabel)
        
        // Başlık etiketinin otomatik boyutlanmasını ayarla
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Hücreye veriyi bağlamak için bir yöntem
    func configure(with title: String) {
        titleLabel.text = title
    }
}

