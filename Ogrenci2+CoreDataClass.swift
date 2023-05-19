//
//  Ogrenci2+CoreDataClass.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//
//

import Foundation
import CoreData

@objc(Ogrenci2)
public class Ogrenci2: NSManagedObject {
    let context = appDelagate.persistentContainer.viewContext
    public var OgrenciDersler:[String]{
        var dersler = [String]()
        let ders1 = try! context.fetch(Dersler.fetchRequest())
        dersler = try! ders1.map({ ders in
            ders.ders_adi
        }) as! [String]
        return try! dersler.sorted()
        
    }
    public var notlar = [String:[Int]]()
    
    
}
