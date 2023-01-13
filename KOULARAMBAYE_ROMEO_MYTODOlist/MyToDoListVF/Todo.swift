//
//  Todo.swift
//  MyToDoListVF
//
//  Created by koularambaye Romeo on 11/01/2023.
//

import Foundation

class Todo{
    var titre: String
    var descrip: String
    var date: Date 
    
    init(titre: String, descrip: String , date: Date) {
        self.titre = titre
        self.descrip = descrip
        self.date = date
        
    }
}
