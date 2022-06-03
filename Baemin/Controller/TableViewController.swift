//
//  TableViewController.swift
//  Baemin
//
//  Created by 강창혁 on 2022/05/30.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableV: UITableView!
    var storeinformation = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BasicSet()
        
    }
    
    func BasicSet() {
        tableV.dataSource = self
        tableV.delegate = self
        //내가 만든 xib파일 이름이 들어감 = TableViewCell
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableV.register(nibName, forCellReuseIdentifier: "tableVCell")
    }
    
    @IBAction func AddStore(_ sender: UIButton) {
        
        let title = "신규 매장 추가"
        let message = "빈칸 전부를 채워주셔야 합니다."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            let newStore = Store(storeImage: UIImage(named: "new.jpeg")!, storeName: "\(alert.textFields![0].text ?? "")" , storeScore: "0.0", storeMinimumOrderPrice: "\(alert.textFields![1].text ?? "")", storeDeliveryTime: "\(alert.textFields![2].text ?? "")")
            self.storeinformation.addCellData(data: newStore)
            self.tableV.reloadData()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "매장 이름" // 안내메시지
            tf.isSecureTextEntry = false // 비밀번호 처리
        })
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "최소 주문 가격" // 안내메시지
            tf.isSecureTextEntry = false // 비밀번호 처리
        })
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "배달 소요 예상 시간" // 안내메시지
            tf.isSecureTextEntry = false // 비밀번호 처리
        })
        self.present(alert, animated: false)
    }
    
    
    
}


extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeinformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableV.dequeueReusableCell(withIdentifier: "tableVCell", for: indexPath) as! TableViewCell
        
        cell.tableVImage.image = storeinformation.datas[indexPath.row].storeImage
        cell.tableVName.text = storeinformation.datas[indexPath.row].storeName
        cell.tableVScore.text = storeinformation.datas[indexPath.row].storeScore
        cell.tableVMinimumOrderPrice.text = storeinformation.datas[indexPath.row].storeMinimumOrderPrice
        cell.tableVDeliveryTime.text = storeinformation.datas[indexPath.row].storeDeliveryTime
        cell.selectionStyle = .none
        return cell
    }
    
}


extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToStroeMenu", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToStoreMenu" {
            let storeMenuVC = segue.destination as! StoreMenuViewController
            let index = sender as! IndexPath
            storeMenuVC.nowindex = index.row
            storeMenuVC.storeMenuInformation = storeinformation
        }
    }
    
}
