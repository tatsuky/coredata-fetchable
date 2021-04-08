//
//  NSManagedObject+create.swift
//  CoreDataSample
//
//  Created by Tatsuki Otsuka on 2021/04/08.
//

import Foundation
import CoreData

extension NSManagedObject {
    
    /// Creates an instance of `NSManagedObject` of matching class in context.
    /// - Parameter context: NSManagedObjectContext
    class func create(in context: NSManagedObjectContext = .defaultContext) -> Self {
        let object = NSManagedObject(entity: self.entity(), insertInto: context)
        return unsafeDowncast(object, to: self)
    }
    
    /// Deletes an instance of `NSManagedObject` of matching class from context.
    /// - Parameter context: NSManagedObjectContext
    func delete(from context: NSManagedObjectContext = .defaultContext) {
        context.delete(self)
    }
    
}
