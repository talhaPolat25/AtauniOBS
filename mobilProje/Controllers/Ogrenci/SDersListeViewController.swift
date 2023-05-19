//
//  SDersListeViewController.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//

import UIKit
import CoreData
class SDersListeViewController: UIViewController {
    @IBOutlet weak var tblDersListesi: UITableView!
    let context = appDelagate.persistentContainer.viewContext
    var topluDersler = [Dersler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        dersleriAl()
    }
    func dersleriAl(){
        let ders1 = try! context.fetch(Dersler.fetchRequest())
        topluDersler = try! ders1.map({ ders in
            ders
        }) as! [Dersler]
    }

}
extension SDersListeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topluDersler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dersListesiCell", for: indexPath) as! OgrenciDersListesiTableViewCell
        let ders = topluDersler[indexPath.row]
        cell.lblDersAdi.text = ders.ders_adi
        return cell
    }
    
    
    
}
