//
//  EditController.swift
//  MartinezR
//
//  Created by Martinez, Richard on 3/12/18.
//  Copyright © 2018 Martinez, Richard. All rights reserved.
//

import UIKit

class EditController: UIViewController {

    @IBOutlet weak var NameF: UITextField!
    @IBOutlet weak var AmountF: UITextField!
    
    let alert = UIAlertController(title: "Empty Input!", message: "Name and Amount need an input!", preferredStyle: UIAlertControllerStyle.alert)
    let alert2 = UIAlertController(title: "Not a Double!", message: "Amount needs to be a money amount!", preferredStyle: UIAlertControllerStyle.alert)
    let alert3 = UIAlertController(title: "Too Many!", message: "Only 4 people each can either owe or lend you money!", preferredStyle: UIAlertControllerStyle.alert)
    override func viewDidLoad() {
        super.viewDidLoad()
        NameF.text = ""
        AmountF.text = ""
        AmountF.keyboardType = UIKeyboardType.decimalPad
        alert.addAction(UIAlertAction(title: "Back!", style: UIAlertActionStyle.default, handler: nil))
        alert2.addAction(UIAlertAction(title: "Back!", style: UIAlertActionStyle.default, handler: nil))
        alert3.addAction(UIAlertAction(title: "Back!", style: UIAlertActionStyle.default, handler: nil))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func Caneller(){
        NameF.text = ""
        AmountF.text = ""
    
    }
    @IBAction func CancelB(_ sender: UIButton) {
        Caneller()
    }
    func isntStringDouble(string: String) -> Bool {
        return Double(string) == nil
    }
    
    
    @IBAction func RemoveB(_ sender: Any) {
        if(NameF.text == ""){
            present(alert, animated: true, completion: nil)
            return
        }
        GlobalController.remover(name: NameF.text!)
        Caneller()
    }
    @IBAction func OweB(_ sender: UIButton) {
        if(NameF.text == "" || AmountF.text == ""){
            present(alert, animated: true, completion: nil)
            return
        }
        if( isntStringDouble(string: AmountF.text!) == true){
            present(alert2, animated: true, completion: nil)
            AmountF.text = ""
            return
        }
        if(GlobalController.nameBadArray.count == 4){
            present(alert3, animated: true, completion: nil)
            Caneller()
            return
        }
        GlobalController.addBadName(newName: NameF.text!)
        GlobalController.addMoneyBad(newMoney: Double(AmountF.text!)!)
        Caneller()
    }
    @IBAction func AddB(_ sender: UIButton) {
        if(NameF.text == "" || AmountF.text == ""){
            present(alert, animated: true, completion: nil)
            return
        }
        if( isntStringDouble(string: AmountF.text!) == true){
            present(alert2, animated: true, completion: nil)
            AmountF.text = ""
            return
        }
        if(GlobalController.nameArray.count == 4){
            present(alert3, animated: true, completion: nil)
            Caneller()
            return
        }
        GlobalController.addName(newName: NameF.text!)
        GlobalController.addMoney(newMoney: Double(AmountF.text!)!)
        Caneller()
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
