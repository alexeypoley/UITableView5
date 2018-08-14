//
//  addVC.swift
//  UITableView5property
//
//  Created by Алексей Полей on 07.08.2018.
//  Copyright © 2018 Алексей Полей. All rights reserved.
//

import UIKit



class addViewController: UIViewController {
    
    var namesTF: String! = ""
    var alphaTF: Double! = 0.0
    
    var massTF: Double! = 0.0
    var index:Int?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var alphaTextField: UITextField!
    @IBOutlet weak var massTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = namesTF
        alphaTextField.text = String(alphaTF)
        massTextField.text = String(massTF)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
