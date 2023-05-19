//
//  Ogrenci1+CoreDataProperties.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//
//

import Foundation
import CoreData


extension Ogrenci1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ogrenci1> {
        return NSFetchRequest<Ogrenci1>(entityName: "Ogrenci1")
    }

    @NSManaged public var ad: String?
    @NSManaged public var mail: String?
    @NSManaged public var onay: Bool
    @NSManaged public var sifre: String?
    @NSManaged public var soyad: String?
    @NSManaged public var tc: String?
    @NSManaged public var telefon: String?
    @NSManaged public var unvan: String?
    @NSManaged public var dersler1: Set<Dersler>?
    
    

}

// MARK: Generated accessors for dersler1
extension Ogrenci1 {

    @objc(addDersler1Object:)
    @NSManaged public func addToDersler1(_ value: Dersler)

    @objc(removeDersler1Object:)
    @NSManaged public func removeFromDersler1(_ value: Dersler)

    @objc(addDersler1:)
    @NSManaged public func addToDersler1(_ values: NSSet)

    @objc(removeDersler1:)
    @NSManaged public func removeFromDersler1(_ values: NSSet)

}

extension Ogrenci1 : Identifiable {

}
