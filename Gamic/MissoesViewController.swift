//
//  MissoesViewController.swift
//  Gamic
//
//  Created by Eric Ribeiro on 14/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import UIKit

class MissoesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saldoLabel: UILabel!

    var missaoDAO = MissaoDAO()
    var missoes = [Missao]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        missoes = missaoDAO.getListaDeMissoes()
        saldoLabel.text = "Saldo: R$\(PerfilDAO.getPerfil().vlrSaldo)"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missaoIdentifier", for: indexPath)
        if let missaoCell = cell as? MissoesTableViewCell {
            let missao = missoes[indexPath.row]
            missaoCell.nomeDaMissao.text = missao.nmMissao
            missaoCell.valorDaMissao.text = "R$\(missao.vlrMissao)"
        }
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            missoes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Nothing yet
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let adicionarMissoesViewController = segue.destination as! AdicionarMissoesViewController
        adicionarMissoesViewController.listaDeMissoes = self.missoes
    }
    
    }
