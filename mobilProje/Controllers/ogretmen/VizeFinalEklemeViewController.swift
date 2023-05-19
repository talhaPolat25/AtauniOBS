//
//  VizeFinalEklemeViewController.swift
//  mobilProje
//
//  Created by talha polat on 27.12.2022.
//

import UIKit
import CoreData
class VizeFinalEklemeViewController: UIViewController {
    let context = appDelagate.persistentContainer.viewContext
    var ogrencim:Ogrenci2!
    var secilenDers:Dersler?
    @IBOutlet weak var lblIsimSoyIsim: UILabel!
    
    @IBOutlet weak var txtFinal: UITextField!
    @IBOutlet weak var txtVize: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back4")!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnGuncelleClicked(_ sender: UIButton) {
        
        if txtVize.text != ""{
            if let vize = txtVize.text, let secilenDers = secilenDers{
                let index = ogrencim?.dersler1!.firstIndex(of: secilenDers)
                let dersBilgi = ogrencim!.dersler1![index!]
                dersBilgi.vize = Int16(vize)!
                appDelagate.saveContext()
            }
        }
        if txtFinal.text != ""{
            if let final = txtFinal.text, let secilenDers = secilenDers{
                let index = ogrencim?.dersler1!.firstIndex(of: secilenDers)
                let dersBilgi = ogrencim!.dersler1![index!]
                dersBilgi.final = Int16(final)!
                appDelagate.saveContext()
            }
        }
        
        /*if txtFinal.text != "" && ogrencim!.notlar[secilenDers!]!.count == 1{
            if let final = txtFinal.text, let secilenDers = secilenDers{
                ogrencim!.notlar[secilenDers]!.insert(Int(final)!, at: 1)
            }
            
        }*/
    }
    
 

}
