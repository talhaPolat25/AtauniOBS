//
//  SifreDegistirmeViewController.swift
//  mobilProje
//
//  Created by talha polat on 25.12.2022.
//

import UIKit

class SifreDegistirmeViewController: UIViewController {
    var kullanici : Ogrenci2?
    let context = appDelagate.persistentContainer.viewContext
    @IBOutlet weak var txtSifreTekrar: UITextField!
    @IBOutlet weak var txtSifre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back4")!)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnYeniSifre(_ sender: UIButton) {
        let BasarisizAlert = UIAlertController(title: "Hatali Giris", message: "Girdiginiz sifre eskisiyle aynı olamaz", preferredStyle:.alert)
        let basariliKayitAlert = UIAlertController(title: "Basarili", message: "Sifreniz başaralı bir şekilde değiştirildi", preferredStyle:.alert)
        let HataliSifreAlert = UIAlertController(title: "Sifreler farklı", message: "Girdiginiz sifreler uyuşmuyor", preferredStyle:.alert)

        let alertOkAction = UIAlertAction(title: "Tamam", style: .default)
        
        BasarisizAlert.addAction(alertOkAction)
        basariliKayitAlert.addAction(alertOkAction)
        HataliSifreAlert.addAction(alertOkAction)
        if let kullanici = kullanici,let sifre = txtSifre.text,let sifreTekrar = txtSifreTekrar.text{
            if sifre != sifreTekrar {
                present(HataliSifreAlert, animated: .random())
            }else if sifre == kullanici.tc{
                present(BasarisizAlert, animated: .random())
            }else {
                self.kullanici!.sifre = sifre
                appDelagate.saveContext()
                present(basariliKayitAlert, animated: .random())
                            }
            
            
        }else{
            self.present(BasarisizAlert, animated: .random())
        }
    }
    

}
