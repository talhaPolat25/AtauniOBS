//
//  YemekTableViewCell.swift
//  mobilProje
//
//  Created by talha polat on 27.12.2022.
//

import UIKit

class YemekTableViewCell: UITableViewCell {
    let context = appDelagate.persistentContainer.viewContext
    @IBOutlet weak var txtTarih: UITextField!
    @IBOutlet weak var txtAraYemek: UITextField!
    @IBOutlet weak var txtAnaYemek: UITextField!
    @IBOutlet weak var txtTatli: UITextField!
    var tarih:String?
    let datePicker = UIDatePicker()
    override func awakeFromNib() {
        super.awakeFromNib()
        createDatePicker()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func createToolBar()->UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([btnDone], animated: true)
        return toolbar
    }
    
    func createDatePicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        txtTarih.inputView = datePicker
        txtTarih.inputAccessoryView = createToolBar()
    }
   @objc func doneClicked(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
       tarih = dateFormatter.string(from: datePicker.date)
        txtTarih.text = dateFormatter.string(from: datePicker.date)
       datePicker.endEditing(true)
       
    }
    
    
    
    @IBAction func txtTatliEndClicked(_ sender: UITextField) {
        let dateFormatter = DateFormatter()
       
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        txtTarih.text = dateFormatter.string(from: datePicker.date)
        if let ara = txtAraYemek.text,let ana = txtAnaYemek.text,let tatli = txtTatli.text,let tarih = txtTarih.text{
            var yemek = YemekListesi(context: context)
            yemek.anaYemek = ana
            yemek.araYemek = ara
            yemek.tatli = tatli
            yemek.tarih1 = tarih
            appDelagate.saveContext()
            print("********************************")
            print("********************************")
            print("********************************")
            print(tarih)
            print("********************************")
            print("********************************")
            print("********************************")
            //appDelagate.saveContext()
        }
        }
    
}
