//
//  SearchViewController.swift
//  NineWest
//
//  Created by macbook pro on 28.04.2023.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    public var categoryNames: [ProdCategory] = []
    public var filteredProducts: Products = []
    
    var viewModel: CategoryTableViewModel = CategoryTableViewModel()
    
    private let categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        view.addSubview(categoryTableView)
        self.title = "Search"
        configureConstraints()
        self.fetchCategoryNames()
    }
    
    private func configureConstraints() {
        categoryTableView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }

    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func fetchCategoryNames() {
        
        viewModel.getData(categoryTableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.categoryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let categoryItemName = viewModel.categoryNames[indexPath.row].name else { return UITableViewCell() }
        cell.textLabel?.text = "\(categoryItemName)"
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let categoryName = viewModel.categoryNames[indexPath.row].name else { return }
        
        
    }
}

