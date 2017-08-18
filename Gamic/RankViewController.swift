//
//  RankViewController.swift
//  Gamic
//
//  Created by Eric Ribeiro on 17/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import UIKit

class RankViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nivel: UILabel!
    @IBOutlet weak var barraDeExp: UIProgressView!
    @IBOutlet weak var quantidadeDeExp: UILabel!

    var rankDAO = [Rank]()
    var perfil = PerfilDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rankDAO = RankDAO.getRank()
        tableView.delegate = self
        tableView.dataSource = self
        exibirInfoUsuario()
    }
    
    func exibirInfoUsuario() {
        let exp = String(format: "%.0f", perfil.getPerfil().exp)
        let limiteDoNivel: Double = 10000
        let limiteDoNivelStr = String(format: "%.0f", limiteDoNivel)
        nivel.text = "Nível \(perfil.getPerfil().nivel)"
        barraDeExp.progress = Float(perfil.getPerfil().exp/limiteDoNivel)
        quantidadeDeExp.text = "\(exp)/\(limiteDoNivelStr)"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankDAO.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rankIdentifier", for: indexPath)
        if let rankCell = cell as? RankTableViewCell {
            let rank = rankDAO[indexPath.row]
            rankCell.posicao.text = "\(rank.posicao)º"
            rankCell.nomeDaImagem.image = UIImage(named: rank.nmImagem)
            rankCell.nomeDoUsuario.text = rank.nickname
            rankCell.experiencia.text = String(format: "%.0f", arguments: [rank.exp])
        }
        return cell
    }
}
