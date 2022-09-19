//
//  ViewController.swift
//  cafeMiniApp
//
//  Created by JAMES DURCAN on 9/9/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var yourMenuOutlet: UITextView!
    @IBOutlet weak var feedbackOutlet: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customerTypeOutlet: UITextField!
    @IBOutlet weak var adminPass: UITextField!
    @IBOutlet weak var normalMenu: UITextView!
    @IBOutlet weak var alphabet: UIButton!
    @IBOutlet weak var price: UIButton!
    
    //admin outlets
    @IBOutlet weak var menuScreen: UIImageView!
    @IBOutlet weak var adminMenu: UITextView!
    @IBOutlet weak var adminLabel1: UILabel!
    @IBOutlet weak var adminLabel2: UILabel!
    @IBOutlet weak var adminLabel3: UILabel!
    @IBOutlet weak var itemEnter: UITextField!
    @IBOutlet weak var priceEnter: UITextField!
    @IBOutlet weak var adminButton: UIButton!
    @IBOutlet weak var adminButton2: UIButton!
    
    var menuItems = ["goldfish": 2.5, "cracker": 5.0, "lettuce": 3.5, "apple": 2.0, "hotdog": 10.0]
    var menu2 = ["GoldFish", "Cracker", "Lettuce", "Apple", "HotDog"]
    var totalPrice = 0.0
    var item: String!
    var menuCheck = false
    var adminScreen = false
    var adminCheck = false
    var menu2Count = 0
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customerTypeOutlet.delegate = self
        adminPass.delegate = self
        for string in menu2{
            adminMenu.text = "\(adminMenu.text ?? "")\(string)       \t \t \t                $ \(menuItems[string.lowercased()]!)0\n"
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == customerTypeOutlet{
            
        customerTypeOutlet.resignFirstResponder()
        for single in menu2 {
            if (menuCheck == false){
                if (single.lowercased() == customerTypeOutlet.text?.lowercased()){
                menuCheck = true
                item = single
                feedbackOutlet.text = "Add something else!"
                
            }
                
            else{
                feedbackOutlet.text = "Try typing in something that's there."
            }
            }
        }
        if menuCheck{
            totalPrice = totalPrice + menuItems[item.lowercased()]!
            totalLabel.text = "$ \(totalPrice)0"
            yourMenuOutlet.text = "\(yourMenuOutlet.text!)\(item!)      \t \t \t                $ \(menuItems[item.lowercased()]!)0\n"
        }
        menuCheck = false
        }
        else if textField == adminPass{
            adminPass.resignFirstResponder()
            if (adminPass.text == "bigJ"){
                menuScreen.image = UIImage(named: "BLACK")
                adminMenu.isHidden = false
                adminLabel1.isHidden = false
                adminLabel2.isHidden = false
                adminLabel3.isHidden = false
                itemEnter.isHidden = false
                priceEnter.isHidden = false
                adminButton.isHidden = false
                adminButton2.isHidden = false
            }
        }
        return true
    }
    
    @IBAction func changeMenuButton(_ sender: UIButton) {
        for i in 0 ..< menu2.count{
            if menu2[i].lowercased() == itemEnter.text!.lowercased(){
                adminCheck = true
                menu2Count = i
            }
        }
        if adminCheck == false{
        menu2.append(itemEnter.text!)
        menuItems["\(itemEnter.text!.lowercased())"] = Double(priceEnter.text!)
        print(menu2)
        print(menuItems)
        adminMenu.text = ""
        for string in menu2{
            adminMenu.text = "\(adminMenu.text ?? "")\(string)   \t \t \t                $ \(menuItems[string.lowercased()] ?? 0.0)0\n"
        }
        }
            if adminCheck == true{
                menuItems.removeValue(forKey: "\(menu2[menu2Count])")
                menu2.remove(at: menu2Count)
                adminMenu.text = ""
                for string in menu2{
                    adminMenu.text = "\(adminMenu.text ?? "")\(string)   \t \t \t                $ \(menuItems[string.lowercased()] ?? 0.0)0\n"
                }
            }
     adminCheck = false
    }
    @IBAction func goBack(_ sender: UIButton) {
        menuScreen.image = nil
        adminMenu.isHidden = true
        adminLabel1.isHidden = true
        adminLabel2.isHidden = true
        adminLabel3.isHidden = true
        itemEnter.isHidden = true
        priceEnter.isHidden = true
        adminButton.isHidden = true
        adminButton2.isHidden = true
        normalMenu.text = ""
        for string in menu2{
            normalMenu.text = "\(normalMenu.text ?? "")\(string)\t \t\t $\(menuItems[string.lowercased()]!)0\n"
        }
    }
    @IBAction func alphabetAction(_ sender: UIButton)
    {
        print(menu2)
        menu2.sort()
        normalMenu.text = ""
        for string in menu2{
            normalMenu.text = "\(normalMenu.text ?? "")\(string)       \t \t     $\(menuItems[string.lowercased()]!)0\n"
        }
    }
    @IBAction func priceButton(_ sender: UIButton) {
        
    }
    
}
