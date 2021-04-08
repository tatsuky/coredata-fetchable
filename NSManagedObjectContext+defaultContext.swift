//
//  NSManagedObjectContext+defaultContext.swift
//  CoreDataSample
//
//  Created by Tatsuki Otsuka on 2021/04/08.
//

import Foundation
import CoreData
import UIKit


extension NSManagedObjectContext {
    
    static var defaultContext: NSManagedObjectContext {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.persistentContainer.viewContext
        }
    }
    
}
