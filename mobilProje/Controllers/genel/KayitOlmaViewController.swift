//
//  KayıtOlmaViewController.swift
//  mobilProje
//
//  Created by talha polat on 22.12.2022.
//

import UIKit

class KayitOlmaViewController: UIViewController {
    let context = appDelagate.persistentContainer.viewContext
    @IBOutlet weak var tcTxt: UITextField!
    @IBOutlet weak var adTxt: UITextField!
    @IBOutlet weak var telefonTxt: UITextField!
    @IBOutlet weak var mailTxt: UITextField!
    @IBOutlet weak var unvanTxt: UITextField!
    
    @IBOutlet weak var soyadTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back4")!)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
     
    }
    @IBAction func kayitOlClicked(_ sender: UIButton) {
        if let ad = adTxt.text,let soyad = soyadTxt.text,let unvan = unvanTxt.text, let telefon = telefonTxt.text, let tc = tcTxt.text,let mail = mailTxt.text{
           let yeniKayit = Ogrenci2(context: context)
    

            yeniKayit.mail = mail
            yeniKayit.soyad = soyad
            yeniKayit.telefon = telefon
            yeniKayit.sifre = tc
            yeniKayit.tc = tc
            yeniKayit.unvan = unvan
            yeniKayit.onay = false
            yeniKayit.ad = ad
          yeniKayit.dersler1 = Set(yeniKayit.OgrenciDerslerCoreData)
            
            
            
            
            appDelagate.saveContext()
          
            let alertController = UIAlertController(title: "Kayıt", message: "Kayıt başarılı yönetici onayını bekleyiniz", preferredStyle: .alert)
            let action = UIAlertAction(title: "Tamam", style: .default){[weak self] _ in
                self?.dismiss(animated: true)
            }
            alertController.addAction(action)
            present(alertController, animated: true)
        }else{
            let alertController = UIAlertController(title: "Kayıt", message: "Lütfen boşlukları doğru doldurduğunuzdan emin olun", preferredStyle: .alert)
            let action = UIAlertAction(title: "Tamam", style: .default){[weak self] _ in
                self?.dismiss(animated: true)
            }
            alertController.addAction(action)
            present(alertController, animated: true)
            print("Eksik bilgi girildi")
        }
        
    }
    

}
