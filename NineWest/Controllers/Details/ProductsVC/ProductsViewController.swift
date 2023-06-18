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
    
    private let prodsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Products"
        fetchData()
        view.backgroundColor = .darkGray
        prodsTableView.dataSource = self
        prodsTableView.delegate = self
        view.addSubview(prodsTableView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        prodsTableView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func fetchData() {
        
        if let selectedCategory = selectedCategory.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            viewModel.fetchAllProducts("\(selectedCategory)", prodsTableView, nil)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = self.forHFilteredItems[indexPath.row].title ?? "test"
        cell.textLabel?.text = viewModel.filteredProducts[indexPath.row].title ?? "test"
        return cell
    }
}
