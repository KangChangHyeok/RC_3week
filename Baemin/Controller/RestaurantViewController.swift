//
//  DeliveryViewController.swift
//  Baemin
//
//  Created by 강창혁 on 2022/05/30.
//

import UIKit
import Tabman
import Pageboy


class RestaurantViewController: TabmanViewController {
    
    @IBOutlet weak var tabBarV: UIView!
    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarSet()
        
    }
    
    func tabBarSet() {
        let oneVC = storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        let twoVC = storyboard?.instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
        let threeVC = storyboard?.instantiateViewController(withIdentifier: "ThreeViewController") as! ThreeViewController
        let fourVC = storyboard?.instantiateViewController(withIdentifier: "FourViewController") as! FourViewController
        let fiveVC = storyboard?.instantiateViewController(withIdentifier: "FiveViewController") as! FIveViewController
        let sixVC = storyboard?.instantiateViewController(withIdentifier: "SixViewController") as! SixViewController
        viewControllers.append(oneVC)
        viewControllers.append(twoVC)
        viewControllers.append(threeVC)
        viewControllers.append(fourVC)
        viewControllers.append(fiveVC)
        viewControllers.append(sixVC)
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        
        bar.layout.transitionStyle = .snap // Customize
        bar.backgroundView.style = .blur(style: .regular)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 15, bottom: 0.0, right: 15)
        
        bar.buttons.customize { (button) in
            button.tintColor = .systemGray// 선택 안되어 있을 때
            button.selectedTintColor = .black
        }
        // 인디케이터 조정
        bar.indicator.backgroundColor = .black
        bar.layout.interButtonSpacing = 25 // 버튼 사이 간격
        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: tabBarV, layout: nil))
        
    }
    
    
}

extension RestaurantViewController: TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        switch index {
        case 0:
            return TMBarItem(title: "돈까스∙회∙일식")
        case 1:
            return TMBarItem(title: "중식")
        case 2:
            return TMBarItem(title: "치킨")
        case 3:
            return TMBarItem(title: "백반∙죽∙국수")
        case 4:
            return TMBarItem(title: "카페∙디저트")
        case 5:
            return TMBarItem(title: "분식")
        default:
            let title = "Page\(index)"
            return TMBarItem(title: title)
        }
    }
    
    
}

extension RestaurantViewController: PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    
}
