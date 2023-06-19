//
//  ProductsViewController.swift
//  NineWest
//
//  Created by macbook pro on 23.05.2023.
//

import UIKit
import SnapKit

class ProductsViewController: UIViewController {

    var viewModel: CategoryTableViewModel = CategoryTableViewModel()
    var forHFilteredItems: Products = []
    
    var selectedCategory: String = ""

    private let prodsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        return collectionView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Products"
        fetchData()
        view.backgroundColor = .darkGray
        prodsCollectionView.dataSource = self
        prodsCollectionView.delegate = self
        view.addSubview(prodsCollectionView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        prodsCollectionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func fetchData() {
        
        if let selectedCategory = selectedCategory.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            viewModel.fetchAllProducts("\(selectedCategory)", prodsCollectionView, nil)
        }
        
    }
    
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // UICollectionView için gerekli olan diğer değişkenler ve işlevler
    
    // UICollectionViewDataSource protokolünün gerektirdiği işlevleri uygulayın
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Veri kaynağınızdan ürünlerin sayısını döndürün
        viewModel.filteredProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let prod = viewModel.filteredProducts[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.black.cgColor
        cell.prodNameLabel.text = prod.title
        cell.prodPriceLabel.text = "\(prod.price ?? 10) ₺"
        cell.prodRateLabel.text = "\(prod.rating?.rate ?? 3.0)"
        
        // Hücrenin içeriğini güncelleyin (ürün verilerini kullanarak)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = 191.0 // Hücre genişliği, collectionView'ın genişliği kadar olacak
        let cellHeight: CGFloat = 285.0 // Hücre yüksekliği, istediğiniz değere göre ayarlayabilirsiniz
        
        return CGSize(width: cellWidth, height: cellHeight)
    }

}
