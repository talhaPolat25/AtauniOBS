//
//  kullanici.swift
//  mobilProje
//
//  Created by talha polat on 22.12.2022.
//

import Foundation
fileprivate let yoneticiAd = "talha"
fileprivate let yoneticiSıfre = "3456"
class Onaylanmamis{
    
    let tcKimlikNO : String
    var sifre : String
    let ad : String
    let soyad : String
    let unvan : String
    let telefon : String
    let mail : String
    
    init(tcKimlikNO: String, ad: String, soyad: String, unvan: String, telefon: String, mail: String) {
        self.tcKimlikNO = tcKimlikNO
        self.sifre = tcKimlikNO
        self.ad = ad
        self.soyad = soyad
        self.unvan = unvan
        self.telefon = telefon
        self.mail = mail
    }
    
}
