//
//  ViewController.swift
//  mobilProje
//
//  Created by talha polat on 20.12.2022.
//

import UIKit
import CoreData
let appDelagate = UIApplication.shared.delegate as! AppDelegate
fileprivate let yoneticiAd = "talha"
fileprivate let yoneticiSıfre = "2525"
let date = Date()
class GirisViewController: UIViewController,UITextFieldDelegate {
    var Ogrenciler=[Ogrenci2]()
    var girisYapanOgrenci : Ogrenci2?
    let context = appDelagate.persistentContainer.viewContext
    @IBOutlet weak var txtSifre: UITextField!
    @IBOutlet weak var txtTcNo: UITextField!
    
    override func viewDidLoad() {
       /* var duyurular = try! context.fetch(Duyurular.fetchRequest())
        for duyuru in duyurular{
            context.delete(duyuru)
            appDelagate.saveContext()
        }*/
        
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "kartal")!)
        txtTcNo.delegate = self
     DersleriAl()
       kisileriAl()
        
    }
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       DersleriAl()
       txtSifre.text = ""
       txtTcNo.text = ""
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let yeniSifreVc = segue.destination as? SifreDegistirmeViewController{
            yeniSifreVc.kullanici = Ogrenciler.first!
            yeniSifreVc.modalPresentationStyle = .fullScreen
        }
        if segue.identifier == "goOgrenci" {
                if let destVC = segue.destination as? UINavigationController,
                    let targetController = destVC.topViewController as? OgrenciViewController {
                    targetController.ogrenci1 = girisYapanOgrenci!
                    targetController.modalPresentationStyle = .fullScreen
                }
            }
        if segue.identifier == "goOgretmen" {
                if let destVC = segue.destination as? UINavigationController,
                    let targetController = destVC.topViewController as? OgretimGorevlisiViewController {
                    targetController.modalPresentationStyle = .fullScreen
                }
            }
        if let yoneticiVc = segue.destination as? YoneticiViewController{
            yoneticiVc.modalPresentationStyle = .fullScreen
        }
    }

    func kisileriAl(){
        do {
            let ogrencilerListe = try context.fetch(Ogrenci2.fetchRequest())
           // yeniKayitlar = ogrencilerListe
            for k in ogrencilerListe{
                print("-----------------------------------------")
                print(k.notlar["Seçmeli Tasarım"])
                
            }
        } catch  {
            print("eleman yok")
        }
    }
   
    @IBAction func btnGirisYapClicked(_ sender: UIButton) {
        let bulunamadiAlert = UIAlertController(title: "Başarısız", message: "Kullanici Bulunamadi ", preferredStyle:.alert)
        let OnaylanmadiAlert = UIAlertController(title: "Onaylanmayan Kullanıcı", message: "Kaydınız yönetici tarafından henüz onaylanmadı", preferredStyle: .alert)
        
        let alertOkAction = UIAlertAction(title: "Tamam", style: .default)
        bulunamadiAlert.addAction(alertOkAction)
        OnaylanmadiAlert.addAction(alertOkAction)
        if txtSifre.text != "" && txtTcNo.text != ""{
            if let tc = txtTcNo.text, let sifre = txtSifre.text{
                let fetch1Request:NSFetchRequest<Ogrenci2> = Ogrenci2.fetchRequest()
                fetch1Request.predicate = NSPredicate(format: "tc == %@ and sifre == %@", tc,sifre)
                do {
                    Ogrenciler = try context.fetch(fetch1Request)
                 
                    }
                 catch  {
                    present(bulunamadiAlert, animated: .random())
                }
        if tc == yoneticiAd && sifre == yoneticiSıfre{
                    performSegue(withIdentifier: "goYonetici", sender: self)
                }
            else if !Ogrenciler.isEmpty{
                if Ogrenciler.first!.tc == Ogrenciler.first!.sifre{
                    if Ogrenciler.first!.onay{
                        performSegue(withIdentifier: "goYeniSifre", sender: self)}
                    else {
                        present(OnaylanmadiAlert, animated: true)
                    }
                    
                }else if !Ogrenciler.first!.onay{
                    present(OnaylanmadiAlert, animated: .random())
                }
                else {
                    
                    girisYapanOgrenci = Ogrenciler.first!
                    if girisYapanOgrenci!.unvan == "ogretmen"{
                        performSegue(withIdentifier: "GoOgretmen", sender: self)
                    }else{
                        print(girisYapanOgrenci?.ad)
                        performSegue(withIdentifier: "goOgrenci", sender: self)
                    }
                }
                
                                    }
            }
            
        }
        
    }
    func DersleriAl(){
       let dersler = try! context.fetch(Dersler.fetchRequest())
        for ders in dersler{
            print(ders.ders_adi)
        }
    }

}

extension GirisViewController{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 13
        
        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        return true
    }
    
    
    
}
