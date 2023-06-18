//
//  CategoryTableViewModel.swift
//  NineWest
//
//  Created by macbook pro on 25.05.2023.
//

import Foundation
import UIKit

class CategoryTableViewModel {
    
    public var categoryNames: [String] = []
    
    public var filteredProducts: Products = []
    
    func getData(_ myTableView: UITableView ) {
        
        APICaller.getAllCategorys { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    
                    self.categoryNames = success
                    myTableView.reloadData()
                    
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchAllProducts( _ categoryName: String, _ myTableView: UITableView, _ index: Int?) {
        
        APICaller.getDataByCategorys(categoryName) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    
                    self.filteredProducts = success
                    myTableView.reloadData()
                    
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
