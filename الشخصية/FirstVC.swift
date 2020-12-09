//
//  FirstVC.swift
//  الشخصية
//
//  Created by Aldana Al Rashidi on 25/11/2020.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
           self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
           self.navigationController!.navigationBar.shadowImage = UIImage()
           self.navigationController!.navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
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
