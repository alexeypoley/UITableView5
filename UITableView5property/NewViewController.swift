//
//  NewViewController.swift
//  UITableView5property
//
//  Created by Алексей Полей on 14.09.17.
//  Copyright © 2017 Алексей Полей. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    
    var index:Int?
    
    var nameArray:[String]!
    var sgArray:[String]!
    var ibuArray:[String]!
    var ebcArray:[String]!
    var alcArray:[String]!
    
    var nameString:String?
    var sgString:String?
    var ibuString:String?
    var ebcString:String?
    var alcString:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toto" {
            
            let destination = segue.destination as! detailTableViewController
            
            destination.index = index
            
            
            destination.nameArray = nameArray
            destination.sgArray = sgArray
            destination.ibuArray = ibuArray
            destination.ebcArray = ebcArray
            destination.alcArray = alcArray

            
        }
        
    }


}
