//
//  DersEkleViewController.swift
//  mobilProje
//
//  Created by talha polat on 27.12.2022.
//

import UIKit

class DersEkleViewController: UIViewController {
    @IBOutlet weak var txtDers: UITextView!
    let context = appDelagate.persistentContainer.viewContext
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back4")!)
        txtDers.layer.borderWidth = 4
        txtDers.layer.borderColor = UIColor.black.cgColor
        txtDers.layer.cornerRadius = 10
    }
    
    @IBAction func btnDersEkleClicked(_ sender: UIButton) {
        duyuruKaydet(self)
    }
    
    @IBAction func duyuruKaydet(_ sender: Any) {
        let ders = txtDers.text
        let dataDuyuru = Dersler(context:context)
        dataDuyuru.ders_adi = ders
        appDelagate.saveContext()
    }

}
