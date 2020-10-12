//
//  MasterDetailSVC.swift
//  bgweather
//
//  Created by Alejandro Agudelo on 12/10/20.
//  Copyright © 2020 Alejandro Agudelo. All rights reserved.
//

import UIKit

class MasterDetailSVC: UISplitViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let navigationVC = viewControllers.first as! UINavigationController
//        let masterVC = navigationVC.rootViewController as! SavedLocationsTVC
//        masterVC.tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MasterDetailSVC: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

extension UINavigationController {

    var rootViewController: UIViewController? {
        return viewControllers.first
    }

}
