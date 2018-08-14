//
//  AddGrainVC.swift
//  UITableView5property
//
//  Created by Алексей Полей on 14.08.2018.
//  Copyright © 2018 Алексей Полей. All rights reserved.
//

import UIKit

let identifireGrain = "grainCell"

//создаем солод без массы
var grain1 = Grain(id: 14, name: "addGrain1", sigma: 0.002, mass: 0.0)
var grain2 = Grain(id: 15, name: "addGrain2", sigma: 0.202, mass: 0.0)
var grain3 = Grain(id: 16, name: "addGrain3", sigma: 0.312, mass: 0.0)
var grain4 = Grain(id: 17, name: "addGrain4", sigma: 0.642, mass: 0.0)
var grain5 = Grain(id: 18, name: "addGrain5", sigma: 0.412, mass: 0.0)
var grain6 = Grain(id: 19, name: "addGrain6", sigma: 0.12, mass: 0.0)
//создаем массив солодов
var addGrainTable: [Grain] = [grain1, grain2, grain3, grain4, grain5, grain6]


class AddGrainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //количество записей в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addGrainTable.count
    }
    //присваиваем имена строкам в таблице
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifireGrain, for: indexPath)
        cell.textLabel?.text = addGrainTable[indexPath.row].name
        return cell
    }
    

 
    
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

}
