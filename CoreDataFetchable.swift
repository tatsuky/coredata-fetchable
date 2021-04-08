//
//  CoreDataFetchable.swift
//  CoreDataSample
//
//  Created by Tatsuki Otsuka on 2021/04/08.
//

import Foundation
import CoreData


protocol CoreDataFetchable where Self: NSManagedObject {
    
    static func fetch(from context: NSManagedObjectContext, orderBy sortDescriptors: [NSSortDescriptor]?, matching predicate: NSPredicate?) -> [Self]
    
    static func deleteAll(from context: NSManagedObjectContext)
    
}


extension CoreDataFetchable {
    
    /// Fetches an array of `NSManagedObject` from context.
    /// - Parameter context: NSManagedObjectContext
    /// - Parameter orderBy: [NSSortDescriptor]?
    /// - Parameter matching: NSPredicate?
    static func fetch(from context: NSManagedObjectContext = .defaultContext, orderBy sortDescriptors: [NSSortDescriptor]? = nil, matching predicate: NSPredicate? = nil) -> [Self] {
        let request = Self.fetchRequest() as! NSFetchRequest<Self>
        request.sortDescriptors = sortDescriptors
        request.predicate = predicate
        
        var records: [Self] = []
        
        do {
            records = try context.fetch(request)
        }
        catch {
            records = []
        }
        
        return records
    }
    
    
    /// Deletes all instances of `NSManagedObject` of matching class from context.
    /// - Parameter context: NSManagedObjectContext
    static func deleteAll(from context: NSManagedObjectContext = .defaultContext) {
        let records = self.fetch(from: context)
        for record in records {
            record.delete()
        }
    }
    
}
