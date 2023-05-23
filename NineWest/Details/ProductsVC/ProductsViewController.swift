//
//  ProductsViewController.swift
//  NineWest
//
//  Created by macbook pro on 23.05.2023.
//

import UIKit
import SnapKit

class ProductsViewController: UIViewController {

    let forHFilteredItems: [Product] = []
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}
