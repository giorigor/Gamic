//
//  AdicionarMissoesViewController.swift
//  Gamic
//
//  Created by Eric Ribeiro on 14/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import UIKit

class AdicionarMissoesViewController: UIViewController {

    
    @IBOutlet weak var nomeDaMissao: UITextField!
    @IBOutlet weak var valorDaMissao: UITextField!
    @IBOutlet weak var quantidadeDeDias: UITextField!
    @IBOutlet weak var btnConfirmar: UIButton!
    var listaDeMissoes = [Missao]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnConfirmar.addTarget(self, action: #selector(adicionarMissao), for: .touchUpInside)
    }
    
    func adicionarMissao(sender: UIButton!) {
        listaDeMissoes.append(
            Missao(
                nmMissao: nomeDaMissao.text!,
                vlrMissao: Double(valorDaMissao.text!)!,
                qtdPorDia: 50,
                qtdDeDias: Int(quantidadeDeDias.text!)!
            )
        )
        retornarParaMissoes()
    }
    
    func retornarParaMissoes() {
        let missoesViewController = self.navigationController?.viewControllers.first as! MissoesViewController
        missoesViewController.missoes = listaDeMissoes
        _ = navigationController?.popViewController(animated: true)
    }
}
