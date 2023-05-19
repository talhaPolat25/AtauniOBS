//
//  OgretmenDersListesiViewController.swift
//  mobilProje
//
//  Created by talha polat on 26.12.2022.
//

import UIKit

class OgretmenDersListesiViewController: UIViewController {
    @IBOutlet weak var tblDersListesi: UITableView!
    let context = appDelagate.persistentContainer.viewContext
    var topluDersler = [Dersler]()
    var secilenDers : Dersler?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back4")!)
        dersleriAl()
    }
    func dersleriAl(){
        let ders1 = try! context.fetch(Dersler.fetchRequest())
        topluDersler = try! ders1.map({ ders in
            ders
        }) as! [Dersler]
    }

}
extension OgretmenDersListesiViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topluDersler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dersListesiCell", for: indexPath) as! OgrenciDersListesiTableViewCell
        let ders = topluDersler[indexPath.row]
        cell.lblDersAdi.text = ders.ders_adi
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenDers = topluDersler[indexPath.row]
        if let secilenDers = secilenDers{
            performSegue(withIdentifier: "changeNot", sender: self)}
        else{
            print("baba ya hani")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nvc = segue.destination as? NotGuncellemeViewController{
            nvc.secilenDers = secilenDers
        }
    }
    
}

