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
    
    @IBOutlet weak var cellDetail: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return hopArrayDetail.count
        case 1:
            return grainArrayDetail.count
        case 2: 0
        default:
            break
        
        }
        return 0
        
        //здесь резмещаем все в одной секции
        //return grainArrayDetail.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        switch section{
        case 0: label.text = "HOPS"
        case 1: label.text = "GRAIN"
        case 2: label.text = "other"
        default:
            break
        }
       // label.text = "HEADER"
        label.backgroundColor = UIColor.lightGray
        return label
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifireDetail, for: indexPath)
      
   
//        cell.textLabel?.text = grainArrayDetail[indexPath.row].name
//        cell.detailTextLabel?.text = String(grainArrayDetail[indexPath.row].mass) + "g"
//        print(String(grainArrayDetail.count) + " grain in recipe")

        
        //cell.textLabel?.text = "section = \(indexPath.section) cell = \(indexPath.row)"
        
        switch indexPath.section{
        case 0: cell.textLabel?.text = hopArrayDetail[indexPath.row].name
                cell.detailTextLabel?.text = String(hopArrayDetail[indexPath.row].mass)
            
        case 1: cell.textLabel?.text = grainArrayDetail[indexPath.row].name
                cell.detailTextLabel?.text = String(grainArrayDetail[indexPath.row].mass)
        default:
            break
            
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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


    
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "edit" {
     let path = tableView.indexPathForSelectedRow
     let destination = segue.destination as! detailViewController
     
     
     */

//при сохранении формы передать переменным значения полей
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //  if segue.identifier == "save" {
      //      nameString = nameTextField.text
      //      sgString = sgTextField.text
       //     ibuString = ibuTextField.text
        //    ebcString = ebcTextField.text
        //    alcString = alcTextField.text
       // }
        
        if segue.identifier == "addVCSegue" {
            if cellDetail.indexPathForSelectedRow?.section == 0 {
                
                let destination = segue.destination as! addViewController
                let path = cellDetail.indexPathForSelectedRow
                destination.namesTF = hopArrayDetail[(path?.row)!].name
                destination.alphaTF = hopArrayDetail[(path?.row)!].alpha
                destination.massTF = hopArrayDetail[(path?.row)!].mass
            }
            if cellDetail.indexPathForSelectedRow?.section == 1 {
                let destination = segue.destination as! addViewController
                let path = cellDetail.indexPathForSelectedRow
                destination.namesTF = grainArrayDetail[(path?.row)!].name
                destination.alphaTF = grainArrayDetail[(path?.row)!].sigma
                destination.massTF = grainArrayDetail[(path?.row)!].mass
            }
            
        }

    }
    

}
