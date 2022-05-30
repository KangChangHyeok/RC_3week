//
//  ViewController.swift
//  Baemin
//
//  Created by 강창혁 on 2022/05/29.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var scrollV: UIScrollView!
    @IBOutlet weak var searchBarV: UIView!
    @IBOutlet weak var searchBarTextFieldV: UIView!
    @IBOutlet weak var bannerCollectionV: UICollectionView!
    
    var nowPage: Int = 0
    let bannerImageArray: [UIImage] = [UIImage(named: "one.jpeg")!,UIImage(named: "two.jpeg")!,UIImage(named: "three.jpeg")!,UIImage(named: "four.jpeg")!,UIImage(named: "five.jpeg")!]
    let caanimation = CAAnimation()
    override func viewDidLoad() {
        super.viewDidLoad()
        firstVNavBarSet()
        bannerCollectionV.delegate = self
        bannerCollectionV.dataSource = self
        bannerTimer()
    }
    
    func firstVNavBarSet() {
        //IB에서 설정시 오류 발생. 일단 코드 복붇함.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(red: 0.16, green: 0.76, blue: 0.74, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        //서치바 모양 뷰 만들기
        searchBarV.backgroundColor = UIColor(red: 0.16, green: 0.76, blue: 0.74, alpha: 1.0)
        searchBarV.layer.cornerRadius = 15
        searchBarV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        searchBarTextFieldV.layer.cornerRadius = 2
        searchBarTextFieldV.layer.shadowOffset = CGSize(width: 1, height: 1)
        searchBarTextFieldV.layer.shadowOpacity = 0.3
        searchBarTextFieldV.layer.shadowColor = UIColor.black.cgColor
    }
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == bannerImageArray.count-1 {
            // 맨 처음 페이지로 돌아감
            bannerCollectionV.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        bannerCollectionV.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
    @IBAction func delivertButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ToDeliveryViewController", sender: sender)
        
    }
    
    
}



extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionV.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.imgView.image = bannerImageArray[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionV.frame.size.width  , height:  bannerCollectionV.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
