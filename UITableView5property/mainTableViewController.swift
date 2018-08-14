//
//  mainTableViewController.swift
//  UITableView5property
//
//  Created by Алексей Полей on 10.04.17.
//  Copyright © 2017 Алексей Полей. All rights reserved.
//

import UIKit



class mainTableViewController: UITableViewController {

    var nameData = ["Indian Pale Ale","American Pale Ale","Wisseberg","Indian Gray","English Pale"]
    var sgData = ["1.040","1.038","1.051","1.039","1.043"]
    var ibuData = ["33","20","7","56","78"]
    var ebcData = ["7","11","12","30","24"]
    var alcData = ["4","5","5.5","7","6"]
    
    /*
     вместо этих массивов берем наши тестовые рецепты
     testRecipe1,testRecipe2,testRecipe3
     */
    
    @IBAction func saveToMainViewController (segue:UIStoryboardSegue) {
        
        //переменные для получения значений с detail B-A
        let detailViewController = segue.source as! detailViewController
        let editedName = detailViewController.nameString
        let editedSg = detailViewController.sgString
        let editedIbu = detailViewController.ibuString
        let editedEbc = detailViewController.ebcString
        let editedAlc = detailViewController.alcString
        let index = detailViewController.index
        
        //заполняем по индексу значения из временных переменных
        nameData[index!] = editedName!
        sgData[index!] = editedSg!
        ibuData[index!] = editedIbu!
        ebcData[index!] = editedEbc!
        alcData[index!] = editedAlc!
        tableView.reloadData()
        
        
        
        
    }
    @IBOutlet weak var sgLabel: UILabel!
    
    let identifire = "tableCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

  

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // заполняем количество ячеек
        //return nameData.count
        return recipesArray.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)

        // заполняем ячейку данными
//        cell.textLabel?.text = nameData[indexPath.row]
//        cell.detailTextLabel?.text = ("SG: " + sgData[indexPath.row] + "  IBU: " + ibuData[indexPath.row] + "  EBC: " + ebcData[indexPath.row] + "  ALC:"  + alcData[indexPath.row] )
    
        //массив рецептов
        let number = recipesArray[indexPath.row]
        cell.textLabel?.text = number.name
        //print("Количество записей в рецепте ", number.hopsArray.count)
        //создаем переменную для выборки из подмассива
        let count = number.hopsArray.count
        var hopsSubtitleLabel: String = ""
        for i in 0..<count {
            //print(number.hopsArray[i].name)
            hopsSubtitleLabel =  hopsSubtitleLabel + " " + number.hopsArray[i].name
        }
        let hopsLabel  = "Hops: " + hopsSubtitleLabel
        print (hopsLabel)
        //расчет алкоголя в рецептe
        print(number.calcAlcoholLevel())
        cell.detailTextLabel?.text = ("Alc: " + String(number.calcAlcoholLevel()))
        
        return cell
    }
 

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            let path = tableView.indexPathForSelectedRow
            let destination = segue.destination as! detailViewController

            //передаем значения в сигвей по идентификатору во временные переменные на detail A-B

            
            destination.index = path?.row
            destination.nameArray = recipesArray[(path?.row)!].name
            destination.hopArrayDetail = recipesArray[(path?.row)!].hopsArray
            destination.grainArrayDetail = recipesArray[(path?.row)!].grainsArray
            
               // destination.sgArray =
               // destination.ibuArray =
               // destination.ebcArray =
               // destination.alcArray =
            
 
        }

    }
 

}
