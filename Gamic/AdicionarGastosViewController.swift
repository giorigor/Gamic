//
//  AdicionarGastosViewController.swift
//  Gamic
//
//  Created by Student on 16/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import UIKit

class AdicionarGastosViewController: UIViewController, UIPickerViewDelegate , UIPickerViewDataSource {
    
    @IBOutlet weak var nomeDoGasto: UITextField!
    @IBOutlet weak var valorDoGasto: UITextField!
    @IBOutlet weak var categoriaDoGasto: UITextField!
    @IBOutlet weak var btnConfirmar: UIButton!
    
    var listaDeGastos = [Gasto]()
    var pickOption = ["Categorias", "Eletrônicos", "Lanches", "Transportes", "Lazer", "Diversos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnConfirmar.addTarget(self, action: #selector(adicionarGasto), for: .touchUpInside)
        let pickerView = UIPickerView()
        pickerView.delegate = self
        categoriaDoGasto.inputView = pickerView
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(AdicionarGastosViewController.dismissPicker))
        
        categoriaDoGasto.inputAccessoryView = toolBar
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoriaDoGasto.text = pickOption[row]
    }
    
    func adicionarGasto(sender: UIButton!) {
        listaDeGastos.append(
            Gasto(
                nmGasto: nomeDoGasto.text!,
                vlrGasto: Double(valorDoGasto.text!)!,
                nmCategoria: String(categoriaDoGasto.text!)!
            )
        )
        retornarParaGastos()
    }
    
    func calcularQtdPorDia(vlrMissao: Double, qtdDeDias: Int) -> Double {
        return vlrMissao.divided(by: Double(qtdDeDias))
    }
    
    func retornarParaGastos() {
        let gastosViewController = self.navigationController?.viewControllers.first as! GastosViewController
        gastosViewController.gastos = listaDeGastos
        _ = navigationController?.popViewController(animated: true)
    }
    
    func dismissPicker() {
        
        view.endEditing(true)
        
    }
    
    // Sobreescrevemos o metodo touchesBegan(_: with:) que é chamado quando tocamos na tela. Isso faz com que você possa para a edição
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Chamamos a view para forçar que a edição pare
        self.view.endEditing(true)
    }
}

extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Confirmar", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
}
