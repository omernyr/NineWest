//
//  SearchViewController.swift
//  NineWest
//
//  Created by macbook pro on 28.04.2023.
//

import UIKit
import SnapKit

enum CategoryNames {
    case xx
    case yy
}

class SearchViewController: UIViewController {
    
    public var categoryNames: [ProdCategory] = []
    public var filteredProducts: Products = []
    
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
        
        APICaller.getAllCategorys { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.categoryNames = success
                    self.categoryTableView.reloadData()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let categoryItemName = categoryNames[indexPath.row].name else { return UITableViewCell() }
        cell.textLabel?.text = "\(categoryItemName)"
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let categories = categoryNames[indexPath.row].name
        
        
        
    }
}
