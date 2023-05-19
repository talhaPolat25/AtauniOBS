//
//  Dersler+CoreDataProperties.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//
//

import Foundation
import CoreData


extension Dersler {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dersler> {
        return NSFetchRequest<Dersler>(entityName: "Dersler")
    }

    @NSManaged public var ders_adi: String?
    @NSManaged public var dersler: NSSet?

}

// MARK: Generated accessors for dersler
extension Dersler {

    @objc(addDerslerObject:)
    @NSManaged public func addToDersler(_ value: Ogrenci)

    @objc(removeDerslerObject:)
    @NSManaged public func removeFromDersler(_ value: Ogrenci)

    @objc(addDersler:)
    @NSManaged public func addToDersler(_ values: NSSet)

    @objc(removeDersler:)
    @NSManaged public func removeFromDersler(_ values: NSSet)

}

extension Dersler : Identifiable {

}
