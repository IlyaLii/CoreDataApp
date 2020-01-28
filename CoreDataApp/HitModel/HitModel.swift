//
//  HitModel.swift
//  CoreDataApp
//
//  Created by Li on 1/28/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit
import CoreData

var people = [NSManagedObject]()

func save(name : String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else { return }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
    
    let person = NSManagedObject(entity: entity, insertInto: managedContext)
    
    person.setValue(name, forKey: "name")
    
    do {
        try managedContext.save()
        people.append(person)
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}

func fetchWith(entityName: String)  {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else { return }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
    
    do {
        people = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
}
