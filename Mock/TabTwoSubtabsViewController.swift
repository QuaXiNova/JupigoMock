//
//  TabTwoSubtabsViewController.swift
//  Mock
//
//  Created by Michelle NW on 6/22/17.
//
//

import UIKit
import XLPagerTabStrip

class TabTwoSubtabsViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        settings.style.buttonBarBackgroundColor = .clear
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 12.5)
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in guard changeCurrentIndex == true else { return }
            oldCell?.label.font = .systemFont(ofSize: 13.5)
            newCell?.label.font = .boldSystemFont(ofSize: 13.5)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let subTabOne = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "subTabOne")
        let subTabTwo = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "subTabTwo")
        let subTabThree = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "subTabThree")
        
        return [subTabOne, subTabTwo, subTabThree]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
