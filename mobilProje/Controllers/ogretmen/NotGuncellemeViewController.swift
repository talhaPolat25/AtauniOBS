//
//  NotGuncellemeViewController.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//

import UIKit
import CoreData
class NotGuncellemeViewController: UIViewController {
    let context = appDelagate.persistentContainer.viewContext
    var secilenDers:Dersler?
    var tumOgrenciler=[Ogrenci2]()
    var secilenOgrenci: Ogrenci2?
    @IBOutlet weak var tblNotDuzenleme: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back4")!)
        kisileriAL()

    }
    override func viewWillAppear(_ animated: Bool) {
        kisileriAL()
        
        tblNotDuzenleme.reloadData()
    }


    func kisileriAL(){
        let fetchRequest : NSFetchRequest<Ogrenci2> = Ogrenci2.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "unvan == %@", "ogrenci")
        tumOgrenciler = try! context.fetch(fetchRequest) as! [Ogrenci2]
        print(tumOgrenciler[1].ad)
    }
        
}
extension NotGuncellemeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return tumOgrenciler.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        secilenOgrenci = tumOgrenciler[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OgretmenNotCell") as! OgretmenNotTableViewCell
        let index = secilenOgrenci?.dersler1!.firstIndex(of: secilenDers!)
        let dersBilgi = secilenOgrenci!.dersler1![index!]
            
        cell.lblVize.text = String(dersBilgi.vize)
        cell.lblFinal.text = String(dersBilgi.final)
       
        cell.lblOgrenciAd.text = "\(secilenOgrenci!.ad!)  \(secilenOgrenci!.soyad!)"
        return cell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        secilenOgrenci = tumOgrenciler[indexPath.row]
            let GuncelleAction = UITableViewRowAction(style:.normal, title: "Guncelle") { rowAction, indexPath in
                
                self.performSegue(withIdentifier: "goNotGuncelle", sender: self)
                
                                
            }
            return[GuncelleAction]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let notVc = segue.destination as? VizeFinalEklemeViewController{
            notVc.ogrencim = secilenOgrenci
            notVc.secilenDers = secilenDers
        }
    }
}
