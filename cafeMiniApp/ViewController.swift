//
//  ViewController.swift
//  cafeMiniApp
//
//  Created by JAMES DURCAN on 9/9/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var feedbackOutlet: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customerTypeOutlet: UITextField!
   
    var menuItems = ["GoldFish": 2.5, "Cracker": 5.0, "Lettuce": 3.5, "Apple": 2.0, "HotDog": 10.0]
    var menu2 = ["GoldFish", "Cracker", "Lettuce", "Apple", "HotDog"]
    var menu = [Int]()
    var item: String!
    var menuCheck = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customerTypeOutlet.delegate = self
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        customerTypeOutlet.resignFirstResponder()
        for single in menu2 {
            if (menuCheck == false){
                if (single.lowercased() == customerTypeOutlet.text?.lowercased()){
                menuCheck = true
                feedbackOutlet.text = "Add something else!"
            }
            else{
                feedbackOutlet.text = "Try typing in something that's there."
            }
            }
        }
        menuCheck = false

        return true
    }
}
