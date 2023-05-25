//
//  CategoryTableViewModel.swift
//  NineWest
//
//  Created by macbook pro on 25.05.2023.
//

import Foundation
import UIKit

class CategoryTableViewModel {
    
    public var categoryNames: [ProdCategory] = []
    
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
    
}
