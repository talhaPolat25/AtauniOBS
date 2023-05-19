//
//  YemekListesiEklemeViewController.swift
//  mobilProje
//
//  Created by talha polat on 27.12.2022.
//

import UIKit

class YemekListesiEklemeViewController: UIViewController {
    @IBOutlet weak var tblYemekListesi: UITableView!
    let context = appDelagate.persistentContainer.viewContext
    var yemekListesi = [YemekListesi]()
    override func viewDidLoad() {
        super.viewDidLoad()

        yemekListesiAL()
    }
    

    func yemekListesiAL(){
        yemekListesi = try! context.fetch(YemekListesi.fetchRequest())
    }


}

extension YemekListesiEklemeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "yemekCell") as! YemekTableViewCell
            
        return cell
    }
    
    
}
