//
//  ViewViewController.swift
//  MyToDoListVF
//
//  Created by koularambaye Romeo on 12/01/2023.
//

import UIKit

class ViewViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var descrip: UITextField!

    @IBOutlet weak var dateP: UIDatePicker!
    
    var data: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        name.delegate = self
        descrip.delegate = self
        dateP.setDate(Date(), animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //saveTask()
        
        return  true
    }
    
    var newItem : Todo?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if let vc = segue.destination
        
        newItem = Todo(titre: name.text!, descrip: descrip.text!, date : dateP.date)
    }
    

   

}
