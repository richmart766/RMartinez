//
//  ChartController.swift
//  MartinezR
//
//  Created by Martinez, Richard on 3/12/18.
//  Copyright © 2018 Martinez, Richard. All rights reserved.
//

import UIKit

class ChartController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalController.nameBadArray.count + GlobalController.nameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let size = GlobalController.nameArray.count
        if(indexPath.row < size ){
            cell.textLabel?.text = GlobalController.nameArray[indexPath.row] + String(format:" has been lent $%.2f", GlobalController.moneyArray[indexPath.row])
        }
        else{
            cell.textLabel?.text = GlobalController.nameBadArray[indexPath.row - size] + String(format:" owes $%.2f", GlobalController.moneyBadArray[indexPath.row-size])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if( editingStyle == UITableViewCellEditingStyle.delete){
            let size = GlobalController.nameArray.count
            if(indexPath.row < size ){
                GlobalController.remover(name: GlobalController.nameArray[indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            else{
                GlobalController.remover(name: GlobalController.nameBadArray[indexPath.row-size])
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
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
