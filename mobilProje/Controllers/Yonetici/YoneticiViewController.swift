//
//  YoneticiViewController.swift
//  mobilProje
//
//  Created by talha polat on 22.12.2022.
//

import UIKit
import CoreData
class YoneticiViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    var viewOpen = true
    var ogrenciDersler = [Dersler]()
    let context = appDelagate.persistentContainer.viewContext
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tblOzellikler: UITableView!
    
    var yeniKayitlar = [Ogrenci2]()
    var YoneticiMemu = ["Ders ekle","Duyuru ekle","Yemek Listesi Düzenle"]
 @IBOutlet weak var tblYeniKayit: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back4")!)
        tblYeniKayit.delegate = self
        tblYeniKayit.dataSource = self
        //2. tablo
        self.contentView.isHidden = true
        viewOpen = false
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.black.cgColor
    }
    override func viewWillAppear(_ animated: Bool) {

        kisileriAl()
        tblYeniKayit.reloadData()
    }
    
    @IBAction func slideMenuBtnClicked(_ sender: UIButton) {
        contentView.isHidden = false
        tblOzellikler.isHidden = false
         
        if !viewOpen{
               viewOpen = true
               self.contentView.frame = CGRect(x: 0, y: 103, width: 225, height: 749)
               self.tblOzellikler.frame = CGRect(x: 0, y: 0, width: 0, height: 255)
            UIView.animate(withDuration: 0.5){
                   self.contentView.frame = CGRect(x: 0, y: 103, width: 225, height: 749)
                   self.tblOzellikler.frame = CGRect(x: 0, y: 0, width: 255, height: 255)
               }
               
           } else{
               self.contentView.isHidden = true
               tblOzellikler.isHidden = true
               viewOpen = false
              /* self.contentView.frame = CGRect(x: 0, y: 103, width: 250, height: 749)
               self.tblOzellikler.frame = CGRect(x: 0, y: 0, width: 255, height: 255)*/
               
               UIView.animate(withDuration: 0.5){
                   self.contentView.frame = CGRect(x: 0, y: 103, width: 290, height: 749)
                   self.tblOzellikler.frame = CGRect(x: 0, y: 0, width: 290, height: 255)
               }

               
           }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblOzellikler{
            if indexPath.row == 1{
                performSegue(withIdentifier: "goDuyuru", sender: self)
            }else if indexPath.row == 0{
                performSegue(withIdentifier: "goDersEkle", sender: self)
            }else{
                performSegue(withIdentifier: "goYemek", sender: self)
            }
        }
    }
    
    
    
    
    func kisileriAl(){
        do { let yeniDers = try context.fetch(Dersler.fetchRequest())
            yeniKayitlar  = try context.fetch(Ogrenci2.fetchRequest()) as! [Ogrenci2]
            print(yeniDers.first?.ders_adi)
            for k in yeniKayitlar{
                print("-----------------------------------------")
                print("\(k.tc) sifresi : \(k.sifre)")
             
               print(yeniDers)
            }
        } catch  {
            print("eleman yok")
        }
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblYeniKayit{
            return yeniKayitlar.count}
        else if tableView == tblOzellikler{
            return YoneticiMemu.count
        }else{
            return 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == tblYeniKayit{
            let cell = tableView.dequeueReusableCell(withIdentifier: "kayitCell", for: indexPath) as! yoneticiTableViewCell
            
            let kisi = yeniKayitlar[indexPath.row]
            cell.lblAd.text = "\(kisi.ad!) \(kisi.soyad!)"
            cell.lblUnvan.text = kisi.unvan
            if kisi.onay{
                cell.imgOnay.isHidden = false
            }
            return cell}
        else if tableView == tblOzellikler{
            let cell = tableView.dequeueReusableCell(withIdentifier: "sideCell") as! SideBarTableViewCell
            cell.lblSide.text = YoneticiMemu[indexPath.row]
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if tableView == tblYeniKayit {
            let silAction = UITableViewRowAction(style: .default, title: "Onaylama") { action, indexpath in
                
                let kullanici = self.yeniKayitlar[indexPath.row]
                
                self.context.delete(kullanici)
                
                appDelagate.saveContext()
                self.kisileriAl()
                self.tblYeniKayit.reloadData()
            }
            
            let onayAction = UITableViewRowAction(style:.normal, title: "Onayla") { rowAction, indexPath in
                
                let kullanici = self.yeniKayitlar[indexPath.row]
                
                kullanici.onay = true
                appDelagate.saveContext()
                
                self.kisileriAl()
                
                self.tblYeniKayit.reloadData()
            }
            return[silAction,onayAction]}
        else{
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tblYeniKayit{
            return 103
        }else if tableView == tblOzellikler {
            return 65
        }else{
            return 55
        }
    }
}


