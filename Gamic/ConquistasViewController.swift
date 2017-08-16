//
//  ConquistasViewController.swift
//  Gamic
//
//  Created by Eric Ribeiro on 16/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import UIKit

class ConquistasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nivel: UILabel!
    @IBOutlet weak var barraDeExp: UIProgressView!
    @IBOutlet weak var quantidadeDeExp: UILabel!
    
    var conquistas = [Conquistas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conquistas = ConquistasDAO.getConquistas()
        tableView.delegate = self
        tableView.dataSource = self
        exibirInfoUsuario()
    }
    
    func exibirInfoUsuario() {
        let perfil = PerfilDAO.getPerfil()
        let exp = String(format: "%.0f", perfil.exp)
        let limiteDoNivel: Double = 10000
        let limiteDoNivelStr = String(format: "%.0f", limiteDoNivel)
        nivel.text = "Nível \(perfil.nivel)"
        barraDeExp.progress = Float(perfil.exp/limiteDoNivel)
        quantidadeDeExp.text = "\(exp)/\(limiteDoNivelStr)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conquistas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conquistasIdentifier", for: indexPath)
        if let conquistaCell = cell as? ConquistasTableViewCell {
            let conquista = conquistas[indexPath.row]
            conquistaCell.descricaoDaConquista.text = conquista.descricao
        }
        return cell
    }


}
