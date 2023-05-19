//
//  Ogrenci2+CoreDataProperties.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//
//

import Foundation
import CoreData


extension Ogrenci2 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ogrenci2> {
        return NSFetchRequest<Ogrenci2>(entityName: "Ogrenci2")
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

    public var OgrenciDerslerCoreData:[Dersler]{
        
        let ders1 = try! context.fetch(Dersler.fetchRequest())

        return  ders1
        
    }

}

// MARK: Generated accessors for dersler1
extension Ogrenci2 {

    @objc(addDersler1Object:)
    @NSManaged public func addToDersler1(_ value: Dersler)

    @objc(removeDersler1Object:)
    @NSManaged public func removeFromDersler1(_ value: Dersler)

    @objc(addDersler1:)
    @NSManaged public func addToDersler1(_ values: NSSet)

    @objc(removeDersler1:)
    @NSManaged public func removeFromDersler1(_ values: NSSet)

}

extension Ogrenci2 : Identifiable {

}
