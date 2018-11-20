//
//  ViewController.swift
//  MartinezR
//
//  Created by Martinez, Richard on 3/12/18.
//  Copyright © 2018 Martinez, Richard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var MoneyL: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        let variable = GlobalController.TotalAmount()
        if(variable > 0){
            MoneyL.text = String(format: "Money Lent: $%.2f",variable)
            MoneyL.textColor = UIColor.init(red: 0, green: 0.8, blue: 0, alpha: 0.9)
        }
        else if(variable < 0){
            MoneyL.text = String(format: "Money Owed: $%.2f",variable * -1)
            MoneyL.textColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 0.9)
        }
        else{
            MoneyL.text = "No lents or Owes!"
            MoneyL.textColor = UIColor.black
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

