//
//  OneViewController.swift
//  Baemin
//
//  Created by 강창혁 on 2022/05/30.
//

import UIKit

class OneViewController: UIViewController {

    @IBOutlet weak var deliveryCollectionV: UICollectionView!
    
    var nowPage: Int = 0
    let deliveryCellImageArray: [UIImage] = [UIImage(named: "image1.jpeg")!,UIImage(named: "image2.jpeg")!,UIImage(named: "image3.jpeg")!,UIImage(named: "image4.jpeg")!,UIImage(named: "image5.jpeg")!,UIImage(named: "image6.jpeg")!,UIImage(named: "image7.jpeg")!,UIImage(named: "image8.jpeg")!,UIImage(named: "image9.jpeg")!,UIImage(named: "image10.jpeg")!,UIImage(named: "image11.jpeg")!,UIImage(named: "image12.jpeg")!,UIImage(named: "image13.jpeg")!,UIImage(named: "image14.jpeg")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        deliveryCollectionV.delegate = self
        deliveryCollectionV.dataSource = self
        bannerTimer()
    }
    
    func bannerTimer() {
            let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
                self.bannerMove()
            }
        }
        // 배너 움직이는 매서드
        func bannerMove() {
            // 현재페이지가 마지막 페이지일 경우
            if nowPage == deliveryCellImageArray.count-1 {
            // 맨 처음 페이지로 돌아감
                deliveryCollectionV.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
                nowPage = 0
                return
            }
            // 다음 페이지로 전환
            nowPage += 1
            deliveryCollectionV.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
        }
}

extension OneViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deliveryCellImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = deliveryCollectionV.dequeueReusableCell(withReuseIdentifier: "DeliveryBannerCell", for: indexPath) as! DeliveryBannerCell
        cell.DeliveryBannerImageV.image = deliveryCellImageArray[indexPath.row]
        return cell
    }
}

extension OneViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: deliveryCollectionV.frame.size.width  , height:  deliveryCollectionV.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}


