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
    
    private let categoryTableView: UITableView = {
        let tableView = UITableView()
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: Filtered func
//                let filteredItems = success.filter { item in
//
//                    if let firstCharacter = item.title?.first {
//                        return firstCharacter == "H"
//                    }
//
//                    return false
//                }
//
//                for item in filteredItems {
//                    print(item.title)
//                }
