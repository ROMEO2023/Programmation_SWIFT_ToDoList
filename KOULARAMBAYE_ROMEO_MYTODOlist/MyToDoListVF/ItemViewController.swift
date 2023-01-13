//
//  ItemViewController.swift
//  MyToDoListVF
//
//  Created by koularambaye Romeo on 12/01/2023.
//

import UIKit

class ItemViewController: UIViewController {
    

    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var dateOfTask: UILabel!
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter .dateStyle = .medium
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = data {
            titre.text = item.titre
            desc.text = item.descrip
            dateOfTask.text = Self.dateFormatter.string(from: item.date)
                                                   
        } else{
            titre.text="ERREUR"
        }
        // Do any additional setup after loading the view.
    }
    

    var data: Todo?
    

}
