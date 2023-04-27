//
//  ViewController.swift
//  NineWest
//
//  Created by macbook pro on 27.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewForTapBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "lalo"
        self.view.backgroundColor = .cyan
        setupUI()
    }
    
    func setupUI() {
        self.title = "lalo"
        designableTapBar()
    }
    
    func designableTapBar() {
        viewForTapBar.layer.cornerRadius = 10.0
    }
    
}

