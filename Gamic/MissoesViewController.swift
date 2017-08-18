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
    var celulaSelecionada:Bool = false
    var linhaAtual = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        missoes = missaoDAO.getListaDeMissoes()
        saldoLabel.text = "Saldo: R$\(PerfilDAO.getPerfil().vlrSaldo)"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        celulaSelecionada = false
        recarregarTabela()
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
            if indexPath.row == linhaAtual {
                construirCelulaDaLinhaAtual(missaoCell: missaoCell, missao: missao)
            } else {
                construirOutrasCelulas(missaoCell: missaoCell, missao: missao)
            }
        }
        return cell
    }
    
    func construirCelulaDaLinhaAtual(missaoCell: MissoesTableViewCell, missao: Missao) {
        if (celulaSelecionada == false) {
            missaoCell.nomeDaMissao.text = missao.nmMissao
            missaoCell.valorDaMissao.text = "R$\(missao.vlrMissao)"
            esconderLinhaDoToggle(missaoCell: missaoCell, missao: missao)
        } else {
            exibirLinhaDoToggle(missaoCell: missaoCell, missao: missao)
        }
    }
    
    func construirOutrasCelulas(missaoCell: MissoesTableViewCell, missao: Missao) {
        missaoCell.nomeDaMissao.text = missao.nmMissao
        missaoCell.valorDaMissao.text = "R$\(missao.vlrMissao)"
        esconderLinhaDoToggle(missaoCell: missaoCell, missao: missao)
    }
    
    func exibirLinhaDoToggle(missaoCell: MissoesTableViewCell, missao: Missao) {
        let qtdPorDia = String(format: "%.2f", arguments: [missao.qtdPorDia])
        missaoCell.quantidadeDeDias.text = "\(missao.qtdDeDias) Dias"
        missaoCell.quantidadePorDia.text = "R$\(qtdPorDia) p/ Dia"
        missaoCell.imgQuantidadeDeDias.isHidden = false
        missaoCell.imgQuatidadePorDia.isHidden = false
        missaoCell.quantidadeDeDias.isHidden = false
        missaoCell.quantidadePorDia.isHidden = false
    }
    
    func esconderLinhaDoToggle(missaoCell: MissoesTableViewCell, missao: Missao) {
        missaoCell.imgQuantidadeDeDias.isHidden = true
        missaoCell.imgQuatidadePorDia.isHidden = true
        missaoCell.quantidadeDeDias.isHidden = true
        missaoCell.quantidadePorDia.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            missoes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Nothing yet
        }
    }
    
    //Guardar a linha atual e expandi-la quando clicada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if linhaAtual != indexPath.row {
            self.celulaSelecionada = true
            self.linhaAtual = indexPath.row
        } else {
            self.celulaSelecionada = false
            self.linhaAtual = -1
        }
        recarregarTabela()
    }
    
    func recarregarTabela() {
        UIView.transition(with: self.tableView,
                          duration: 0.15,
                          options: [.curveEaseIn, .transitionCrossDissolve],
                          animations: { () -> Void in
                            self.tableView.reloadData()
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == linhaAtual {
            if celulaSelecionada == false {
                celulaSelecionada = true
                return 55
            } else {
                celulaSelecionada = false
                return 90
            }
        }
        return 55
    }
    
    //Passando os dados para a tela "Adicionar Missões"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let adicionarMissoesViewController = segue.destination as! AdicionarMissoesViewController
        adicionarMissoesViewController.listaDeMissoes = self.missoes
    }
}
