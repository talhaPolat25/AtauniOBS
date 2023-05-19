//
//  OgretimGorevlisiViewController.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//

import UIKit
import CoreData
class OgretimGorevlisiViewController: UIViewController {
    @IBOutlet weak var lblAraYemek: UILabel!
    
    @IBOutlet weak var lblAnaYemek: UILabel!
    
    @IBOutlet weak var lblTatli: UILabel!
    
    @IBOutlet weak var lblTarih: UILabel!
    var yemek : YemekListesi?
    
    let context = appDelagate.persistentContainer.viewContext
    var viewOpen = true
    var duyuru=""
    let duyurular = [Duyurular]()
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tblOzellikler: UITableView!
    let cells = ["Ders Listesi","Notları Güncelle"]
    
    @IBOutlet weak var txtDuyuru: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back4")!)
        self.contentView.isHidden = true
        viewOpen = false
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.black.cgColor
        //duyuru yazdırma
        yemekGetir()
        if let yemek = yemek {
            lblTarih.text = yemek.tarih1
            lblTatli.text = yemek.tatli
            lblAnaYemek.text = yemek.anaYemek
            lblAraYemek.text = yemek.araYemek
        }else{
            //fatalError("yemek gelmedi babba")
        }
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
               self.contentView.frame = CGRect(x: 0, y: 103, width: 225, height: 749)
               self.tblOzellikler.frame = CGRect(x: 0, y: 0, width: 255, height: 255)
               
               UIView.animate(withDuration: 0.5){
                   self.contentView.frame = CGRect(x: 0, y: 103, width: 225, height: 749)
                   self.tblOzellikler.frame = CGRect(x: 0, y: 0, width: 255, height: 255)
               }

               
           }
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        do {
            let duyurular = try context.fetch(Duyurular.fetchRequest()) as! [Duyurular]
            for duyuruVeri in duyurular{
            duyuru.append("-> \(duyuruVeri.duyuru!) \n")
            }
            txtDuyuru.text = duyuru
        } catch  {
            print("duyurular alınamadı")
        }
    }
    func yemekGetir(){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let tarih = dateFormatter.string(from: date)
        //yemekleri çekme
        let fetchRequest:NSFetchRequest<YemekListesi> = YemekListesi.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "tarih1 == %@", tarih)
        let yemek1 = try! context.fetch(fetchRequest)
        yemek = yemek1.last
    }
    
}
extension OgretimGorevlisiViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideCell") as! SideBarTableViewCell
        cell.lblSide.text = cells[indexPath.row]
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "goOgretmenDersListe", sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
