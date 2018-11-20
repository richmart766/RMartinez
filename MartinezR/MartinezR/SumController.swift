//
//  SumController.swift
//  MartinezR
//
//  Created by Martinez, Richard on 3/13/18.
//  Copyright © 2018 Martinez, Richard. All rights reserved.
//

import UIKit

class SumController: UIViewController {

    @IBOutlet weak var LentTotal: UILabel!
    @IBOutlet weak var OwedTotal: UILabel!
    @IBOutlet weak var OwedL: UILabel!
    @IBOutlet weak var BadL: UILabel!
    @IBOutlet weak var AmountL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        OwedL.text = ""
        BadL.text = ""
        AmountL.text = ""
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        OwedL.text = ""
        var currentV = 0
        for current in GlobalController.nameArray{
            OwedL.text = OwedL.text! + current + String(format: ":  $%.2f", GlobalController.moneyArray[currentV]) + "\n"
            currentV = currentV + 1
        }
        BadL.text = ""
        var currentV2 = 0
        for current in GlobalController.nameBadArray{
            BadL.text = BadL.text! + current + String(format: ":  $%.2f", GlobalController.moneyBadArray[currentV2]) + "\n"
            currentV2 = currentV2 + 1
        }
        LentTotal.text = String(format: "Money you Lent: $%.2f", GlobalController.TotalLent())
        OwedTotal.text = String(format: "Money Owed: $%.2f", GlobalController.TotalOwed())
        AmountL.text = ""
        let total = GlobalController.TotalAmount()
        if (total > 0){
            AmountL.text = String(format: "Lent  $%.2f", GlobalController.TotalAmount())
            AmountL.textColor = UIColor.init(red: 0, green: 0.8, blue: 0, alpha: 0.9)
        }
        else if (total < 0){
            AmountL.text = String(format: "Owe  $%.2f", GlobalController.TotalAmount() * -1)
            AmountL.textColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 0.9)
        }
        else{
            AmountL.text = "$0.00"
            AmountL.textColor = UIColor.black
        }
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
