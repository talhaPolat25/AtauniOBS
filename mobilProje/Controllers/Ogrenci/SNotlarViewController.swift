//
//  SNotlarViewController.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//

import UIKit
import CoreData
class SNotlarViewController: UIViewController {
    var ogrenci : Ogrenci2?
    var secilenDers:Dersler?
    var tumOgrenciler=[Ogrenci2]()
    var dersler = [Dersler]()
    let context = appDelagate.persistentContainer.viewContext
    @IBOutlet weak var tblNotlar: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(ogrenci!.ad)
       // print(ogrenci?.OgrenciDersler[3].vize)
        kisileriAL()
        DersleriAl()
        print(ogrenci!.OgrenciDersler[0]) }
    func DersleriAl(){
        dersler = try! context.fetch(Dersler.fetchRequest())
        for ders in dersler{
            print(ders.ders_adi)
        }
    }
    func kisileriAL(){
        let fetchRequest : NSFetchRequest<Ogrenci2> = Ogrenci2.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "unvan == %@", "ogrenci")
        tumOgrenciler = try! context.fetch(fetchRequest) as! [Ogrenci2]
        print(tumOgrenciler[1].ad)
    }

}
extension SNotlarViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sayi = ogrenci!.OgrenciDerslerCoreData.count
        return sayi
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ders = dersler[indexPath.row]
        let not = Int(harfNotuHesaplama(vize: ders.vize, final: ders.final))
        let cell = tableView.dequeueReusableCell(withIdentifier: "ogrenciNotCell") as! SNotlarTableViewCell
        if ders.vize == 0{
            cell.lblDersAdi.text = ders.ders_adi
            cell.HarfNotuView.isHidden = true
        }else if ders.final == 0 && ders.vize != 0{
            cell.lblDersAdi.text = ders.ders_adi
            cell.lblVize.text = String(ders.vize)
            cell.HarfNotuView.isHidden = true
        }
        else{
            cell.lblFinal.text = String(ders.final)
            cell.lblVize.text = String(ders.vize)
            cell.lblDersAdi.text = ders.ders_adi
            switch  not{
            case 0...45:cell.lblHarfNotu.text = "FF"
            case 46...55:cell.lblHarfNotu.text = "CC"
            case 56...65:cell.lblHarfNotu.text = "CB"
            case 66...75:cell.lblHarfNotu.text = "BB"
            case 76...85:cell.lblHarfNotu.text = "BA"
            default : cell.lblHarfNotu.text = "AA"
            }
            if not<45{
                cell.HarfNotuView.backgroundColor = .red
            }else{
                cell.HarfNotuView.backgroundColor = .green
            }
            
        }
        return cell
            
     }
    
    func harfNotuHesaplama(vize:Int16,final:Int16)->Int16{
        return (vize+final)/2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 141
    }
}
