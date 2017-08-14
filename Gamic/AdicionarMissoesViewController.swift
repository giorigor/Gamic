//
//  AdicionarMissoesViewController.swift
//  Gamic
//
//  Created by Eric Ribeiro on 14/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import UIKit

protocol AddMissoesControllerDelegate {
    func addMissoesControlerResponse()
}

class AdicionarMissoesViewController: UIViewController {

    
    @IBOutlet weak var nomeDaMissao: UITextField!
    @IBOutlet weak var valorDaMissao: UITextField!
    @IBOutlet weak var quantidadeDeDias: UITextField!
    @IBOutlet weak var btnConfirmar: UIButton!
    var listaDeMissoes = [Missao]()
    var delegate: AddMissoesControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnConfirmar.addTarget(self, action: #selector(adicionarMissao), for: .touchUpInside)
    }
    
    func adicionarMissao(sender: UIButton!) {
        let nmMissao = nomeDaMissao.text!
        let vlrMissao = Double(valorDaMissao.text!)
        let qtdDias = Int(quantidadeDeDias.text!)
        let missao = Missao(nmMissao: nmMissao, vlrMissao: vlrMissao!, qtdPorDia: 50, qtdDeDias: qtdDias!)
        listaDeMissoes.append(missao)
        retornarParaMissoes()
    }
    
    func retornarParaMissoes() {
        let missoesViewController = self.navigationController?.viewControllers.first as! MissoesViewController
        missoesViewController.missoes = listaDeMissoes
        _ = navigationController?.popViewController(animated: true)
    }
}
