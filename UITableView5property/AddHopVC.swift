//
//  AddHopVC.swift
//  UITableView5property
//
//  Created by Алексей Полей on 14.08.2018.
//  Copyright © 2018 Алексей Полей. All rights reserved.
//

import UIKit

let identifireHop = "hopCell"

//создаем хмель без массы
var hop1 = Hop(id: 14, name: "addHop1", alpha: 0.002, mass: 0.0)
var hop2 = Hop(id: 15, name: "addHop2", alpha: 0.202, mass: 0.0)
var hop3 = Hop(id: 16, name: "addHop3", alpha: 0.312, mass: 0.0)
var hop4 = Hop(id: 17, name: "addHop4", alpha: 0.642, mass: 0.0)
var hop5 = Hop(id: 18, name: "addHop5", alpha: 0.412, mass: 0.0)
var hop6 = Hop(id: 19, name: "addHop6", alpha: 0.12, mass: 0.0)
//создаем массив [хмелей]
var addHopTable: [Hop] = [hop1, hop2, hop3, hop4, hop5, hop6]


class AddHopVC: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return addHopTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifireHop, for: indexPath)
        cell.textLabel?.text = addHopTable[indexPath.row].name
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
