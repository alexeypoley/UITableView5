//
//  detailTableViewController.swift
//  UITableView5property
//
//  Created by Алексей Полей on 10.04.17.
//  Copyright © 2017 Алексей Полей. All rights reserved.
//

import UIKit


let identifireDetail = "cellDetail"


class detailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //здесь резмещаем все в одной секции
        return grainArrayDetail.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifireDetail, for: indexPath)
      
      //  let number = grainArrayDetail[indexPath.row]
        cell.textLabel?.text = grainArrayDetail[indexPath.row].name
        cell.detailTextLabel?.text = String(grainArrayDetail[indexPath.row].mass) + "g"
        print(String(grainArrayDetail.count) + " grain in recipe")

        
        return cell
    }
    

    //добавление аутлетов, для возможности взаимодействия объектов с контроллером

    
    //@IBOutlet weak var nameTextField: UITextField!
    //@IBOutlet weak var sgTextField: UITextField!
    //@IBOutlet weak var ibuTextField: UITextField!
    //@IBOutlet weak var ebcTextField: UITextField!
    //@IBOutlet weak var alcTextField: UITextField!
    

    
     //Переменные для получения A-B
    var index:Int?
    
    var nameArray:String!
    //массив для принятия списка HOP из рецепта
    var hopArrayDetail:[Hop]!
    var grainArrayDetail:[Grain]!
    
    
    var sgArray:[String]!
    var ibuArray:[String]!
    var ebcArray:[String]!
    var alcArray:[String]!
    
    //переменные для передачи в main  B-A
    var nameString:String?
    var sgString:String?
    var ibuString:String?
    var ebcString:String?
    var alcString:String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //при загрузке вью передать текстовым полям значения переменных
    //nameTextField.text = nameArray[index!]
    //sgTextField.text = sgArray[index!]
    //ibuTextField.text = ibuArray[index!]
    //ebcTextField.text = ebcArray[index!]
    //alcTextField.text = alcArray[index!]
        
     nameTextField.text = nameArray
     
    
    }


    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveToMainTableViewController: UIBarButtonItem!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }



//при сохранении формы передать переменным значения полей
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            nameString = nameTextField.text
      //      sgString = sgTextField.text
       //     ibuString = ibuTextField.text
        //    ebcString = ebcTextField.text
        //    alcString = alcTextField.text
        }

    }
    

}
