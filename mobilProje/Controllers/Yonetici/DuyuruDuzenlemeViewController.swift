//
//  DuyuruDuzenlemeViewController.swift
//  mobilProje
//
//  Created by talha polat on 25.12.2022.
//

import UIKit
import CoreData

class DuyuruDuzenlemeViewController: UIViewController {
    let context = appDelagate.persistentContainer.viewContext
    @IBOutlet weak var txtDuyuru: UITextView!
    var duyuru = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back4")!)
        txtDuyuru.layer.borderWidth = 4
        txtDuyuru.layer.borderColor = UIColor.black.cgColor
        txtDuyuru.layer.cornerRadius = 10
    }
    

    @IBAction func duyuruKaydet(_ sender: Any) {
        duyuru = txtDuyuru.text
        let dataDuyuru = Duyurular(context:context)
        dataDuyuru.duyuru = duyuru
        appDelagate.saveContext()
    }
    

}
