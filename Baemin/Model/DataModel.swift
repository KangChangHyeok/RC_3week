//
//  DataModel.swift
//  Baemin
//
//  Created by 강창혁 on 2022/06/02.
//

import Foundation
import UIKit

class DataModel {
    
    var datas: [Store] = [Store(storeImage: UIImage(named: "일백돈가스.jpeg")!, storeName: "일백 돈까스", storeScore: "4.9", storeMinimumOrderPrice: "8000원", storeDeliveryTime: "17~32분"),
                          Store(storeImage: UIImage(named: "돈까스회관.jpeg")!, storeName: "돈까스 회관", storeScore: "4.7", storeMinimumOrderPrice: "13000원", storeDeliveryTime: "28~42분"),
                          Store(storeImage: UIImage(named: "돈카춘.jpeg")!, storeName: "돈카춘", storeScore: "5.0", storeMinimumOrderPrice: "9500원", storeDeliveryTime: "37~52분"),
                          Store(storeImage: UIImage(named: "흑산도수산.jpeg")!, storeName: "흑산도수산", storeScore: "4.7", storeMinimumOrderPrice: "25000원", storeDeliveryTime: "15~30분"),
                          Store(storeImage: UIImage(named: "올라카츠.jepg")!, storeName: "올라카츠", storeScore: "4.9", storeMinimumOrderPrice: "9000원", storeDeliveryTime: "49~64분")]
    var menu: [Menu] = [Menu(menuImage: UIImage(named: "일백돈가스수제등심돈까스.jpeg")!, menuName: "수제등심돈까스", menuPrice: "8,000원", menuDescription: "수제등심돈까스 + 엄마손맛깍두기 + 샐러드 + 밥 + 우동국물"),
                        Menu(menuImage: UIImage(named: "돈까스회관싱글세트.jpeg")!, menuName: "싱글세트", menuPrice: "14,500원", menuDescription: "등심돈까스2장 + 치즈돈까스1장 + 치킨까스 1장"),
                        Menu(menuImage: UIImage(named: "돈카춘생면냉모밀.jpeg")!, menuName: "생면 냉모밀", menuPrice: "7,500원", menuDescription: "생면 냉모밀 + 살얼음육수(진공팩별도제공) + 기본토핑(대파/오이/무조미김) + 간무/와사비"),
                        Menu(menuImage: UIImage(named: "흑산도수산광어.jpeg")!, menuName: "광어", menuPrice: "30,000원 ~ 35,000원", menuDescription: ""),
                        Menu(menuImage: UIImage(named: "올라카츠왕돈까스.jpeg")!, menuName: "올라카츠왕돈까스", menuPrice: "9,500원", menuDescription: "등심/바삭바삭/특제소소/비빔만두/단무지/콘 옥수수/스프/밥")]
    public var count: Int { return datas.count }
    
    
    // R
    public func getCellData(index: Int) -> Store {
        return datas[index]
    }
    
    // C
    public func addCellData(data: Store) {
        datas.append(data)
    }
    
    // U
    public func update(data: Store, index: Int) {
        datas[index] = data
    }
    
    // D
    public func delete(index: Int) {
        datas.remove(at: index)
    }
}


