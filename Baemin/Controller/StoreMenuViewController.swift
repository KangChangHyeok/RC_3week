//
//  StoreMenuViewController.swift
//  Baemin
//
//  Created by 강창혁 on 2022/06/03.
//

import UIKit

class StoreMenuViewController: UIViewController {

    @IBOutlet weak var menuTableV: UITableView!
    var storeMenuInformation = DataModel()
    var nowindex : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableV.dataSource = self
        menuTableV.delegate = self
        menuTableV.register(
            UINib(nibName: "MenuTableViewCell", bundle: nil),
            forCellReuseIdentifier: "MenuTableViewCell")
        dump(storeMenuInformation)
    }

}


extension StoreMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableV.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.menuImage.image = storeMenuInformation.menu[indexPath.row].menuImage
        cell.menuName.text = storeMenuInformation.menu[indexPath.row].menuName
        cell.menudescription.text = storeMenuInformation.menu[indexPath.row].menuDescription
        cell.menuPrice.text = storeMenuInformation.menu[indexPath.row].menuPrice
        
        return cell
    }
    
    
}
extension StoreMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    

}
