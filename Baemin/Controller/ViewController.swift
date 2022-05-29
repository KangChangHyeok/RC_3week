//
//  ViewController.swift
//  Baemin
//
//  Created by 강창혁 on 2022/05/29.
//

import UIKit
class ViewController: UIViewController {

    
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstVNavBarSet()
//        setupSearchBar()
    }

    func firstVNavBarSet() {
        //IB에서 설정시 오류 발생. 일단 코드 복붇함.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(red: 0.16, green: 0.76, blue: 0.74, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.searchController = searchController
        
        //searchbar setting
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.placeholder = "배고프니까 일단 검색!!"
        searchController.searchBar.searchTextField.leftView?.tintColor = UIColor(red: 0.16, green: 0.76, blue: 0.74, alpha: 1.0)
    }
    
//    func setupSearchBar() {
//        searchBar.backgroundColor = UIColor(red: 0.16, green: 0.76, blue: 0.74, alpha: 1.0)
//        searchBar.searchTextField.layer.borderColor = .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
//        searchBar.searchTextField.layer.borderWidth = 1
//        searchBar.searchTextField.layer.cornerRadius = 4
//        searchBar.searchTextField.backgroundColor = .white
//    }

}

