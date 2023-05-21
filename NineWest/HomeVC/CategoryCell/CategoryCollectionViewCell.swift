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
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.backgroundColor = .blue
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Hücre yeniden kullanılmadan önce başlangıç durumuna getirilecek özel ayarları yapabilirsiniz.
    }
    
    // Hücreye veriyi bağlamak için bir yöntem
    func configure(with title: String) {
        titleLabel.text = title
    }
}

