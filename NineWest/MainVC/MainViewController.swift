//
//  ViewController.swift
//  NineWest
//
//  Created by macbook pro on 27.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var viewForTapBar: UIView!
    @IBOutlet var contentView: UIView!
    
    
    
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
        viewForTapBar.clipsToBounds = true
        viewForTapBar.layer.cornerRadius = 10.0
    }
    
    @IBAction func onClickTapBar(_ sender: UIButton) {
        
        let tag = sender.tag
        
        if tag == 1 {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return }
            contentView.addSubview(vc.view)
            vc.didMove(toParent: self)
        } else if tag == 2 {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "SearchViewController") as? SearchViewController else { return }
            contentView.addSubview(vc.view)
            vc.didMove(toParent: self)
        } else if tag == 3 {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "BasketViewController") as? BasketViewController else { return }
            contentView.addSubview(vc.view)
            vc.didMove(toParent: self)
        } else if tag == 4 {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "PersonViewController") as? PersonViewController else { return }
            contentView.addSubview(vc.view)
            vc.didMove(toParent: self)
        } else if tag == 5 {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "NotificationViewController") as? NotificationViewController else { return }
            contentView.addSubview(vc.view)
            vc.didMove(toParent: self)
        }
    }
    
}

