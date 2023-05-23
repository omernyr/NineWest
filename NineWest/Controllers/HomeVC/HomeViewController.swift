//
//  HomeViewController.swift
//  NineWest
//
//  Created by macbook pro on 28.04.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
// "⚙︎" "✺"
    // Variables
    public let data = ["Yeni", "Ayakkabı", "Sneaker", "Topuklular", "Sandalet", "Terlik", "Çanta"]
    
    public let categoryCollectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APICaller.getAllProducts { result in
//            switch result {
//            case .success(let success):
//                
//            case .failure(let failure):
//                print(failure)
//            }
        }
        
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        categoryCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    func setupUI() {
        view.addSubview(categoryCollectionView)
        designCollectionView()
        configureConstraints()
    }
    
    func designCollectionView() {
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    }
    
    func configureConstraints() {
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
//            make.width.equalToSuperview().inset(20)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(50.0)
        }
    }
    
}
