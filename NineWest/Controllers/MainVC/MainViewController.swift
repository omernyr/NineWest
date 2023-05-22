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
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    
    var lastButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "lalo"
        self.view.backgroundColor = .cyan
        
        setupUI()
        
        DispatchQueue.main.async {
            self.forHome()
        }
    }
    
    func forHome() {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return }
        contentView.addSubview(vc.view)
        addChild(vc)
        vc.didMove(toParent: self)
    }
    
    func setupUI() {
        self.title = "lalo"
        designableTapBar()
    }
    
    func designableTapBar() {
        viewForTapBar.clipsToBounds = true
        viewForTapBar.layer.cornerRadius = 10.0
        
        viewForTapBar.layer.borderWidth = 1.0
        viewForTapBar.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func onClickTapBar(_ sender: UIButton) {
        
        lastButton?.tintColor = .secondaryLabel

        let tag = sender.tag
        
        switch tag {
        case 1:
            button1.tintColor = UIColor.black
            forHome()
        case 2:
            button2.tintColor = UIColor.black
            guard let vc = self.storyboard?.instantiateViewController(identifier: "SearchViewController") as? SearchViewController else { return }
            contentView.addSubview(vc.view)
            addChild(vc)
            vc.didMove(toParent: self)
        case 3:
            button3.tintColor = UIColor.black
            guard let vc = self.storyboard?.instantiateViewController(identifier: "BasketViewController") as? BasketViewController else { return }
            contentView.addSubview(vc.view)
            addChild(vc)
            vc.didMove(toParent: self)
        case 4:
            button4.tintColor = UIColor.black
            guard let vc = self.storyboard?.instantiateViewController(identifier: "PersonViewController") as? PersonViewController else { return }
            contentView.addSubview(vc.view)
            addChild(vc)
            vc.didMove(toParent: self)
        case 5:
            button5.tintColor = UIColor.black
            guard let vc = self.storyboard?.instantiateViewController(identifier: "NotificationViewController") as? NotificationViewController else { return }
            contentView.addSubview(vc.view)
            addChild(vc)
            vc.didMove(toParent: self)
        default:
            break
        }
        
        lastButton = sender
        
    }
}
