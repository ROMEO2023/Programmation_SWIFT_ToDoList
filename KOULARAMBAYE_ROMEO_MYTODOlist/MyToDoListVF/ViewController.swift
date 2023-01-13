//
//  ViewController.swift
//  MyToDoListVF
//
//  Created by koularambaye Romeo on 11/01/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.Titre.text = items[indexPath.row].titre
        
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.items.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
    
        })
        ])
        
        //updateitems
        return configuration
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //ajouter le drag on drop  @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var MytableView: UITableView!
    
    var items = [Todo]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My To Do List"
        
        MytableView.delegate = self
        MytableView.dataSource = self
        
        self.items = self.items.sorted(by: {$0.date < $1.date})
        // Do any additional setup after loading the view.
        
        updateItems()
    }
    
    func updateItems() {
        //tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            if let item = UserDefaults().value(forKey: "item_\(x+1)") as? Todo {
               items.append(item)
            }
        }
        MytableView.reloadData()
        
    }
    
    @IBAction func TapAdd(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "view") as! ViewViewController
        vc.title = "Nouvelle Tache"
        vc.data = {
            DispatchQueue.main.async {
                self.updateItems()
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func unwindToAdd(_ unwindSegue: UIStoryboardSegue) {
        
        
        if let vc = unwindSegue.source as? ViewViewController {
            if let todo = vc.newItem {
                
                items.append(todo)
            }
        }
        self.items = self.items.sorted(by: {$0.date < $1.date})
        MytableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ItemViewController{
            let row = MytableView.indexPathForSelectedRow!.row
            vc.data = items[row]
            vc.title = "My Task"
        }
    }


}

