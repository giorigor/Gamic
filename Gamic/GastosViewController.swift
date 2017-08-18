//
//  GastosViewController.swift
//  Gamic
//
//  Created by Student on 16/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import UIKit

class GastosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var gastosLabel: UILabel!
    
    var gastoDAO = GastoDAO()
    var gastos = [Gasto]()
    var gastosTotais: Double = 0.0
    var celulaSelecionada:Bool = false
    var linhaAtual = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gastos = gastoDAO.getListaDeGastos()
        saldoLabel.text = "Saldo: R$\(PerfilDAO.getPerfil().vlrSaldo)"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        celulaSelecionada = false
        calcularGastoTotal()
        gastosLabel.text = "Gastos: R$ \(gastosTotais)"
        recarregarTabela()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gastos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gastoIdentifier", for: indexPath)
        if let gastoCell = cell as? GastosTableViewCell {
            let gasto = gastos[indexPath.row]
            if indexPath.row == linhaAtual {
                construirCelulaDaLinhaAtual(gastoCell: gastoCell, gasto: gasto)
            } else {
                construirOutrasCelulas(gastoCell: gastoCell, gasto: gasto)
            }
        }
        return cell
    }
    
    func calcularGastoTotal() {
        for gasto in gastos {
           gastosTotais += gasto.vlrGasto
        }
    }
    
    func construirCelulaDaLinhaAtual(gastoCell: GastosTableViewCell, gasto: Gasto) {
        if (celulaSelecionada == false) {
            gastoCell.nomeGasto.text = gasto.nmGasto
            gastoCell.nomeGasto.text = "R$\(gasto.vlrGasto)"
            esconderLinhaDoToggle(gastoCell: gastoCell, gasto: gasto)
        } else {
            exibirLinhaDoToggle(gastoCell: gastoCell, gasto: gasto)
        }
    }
    
    func construirOutrasCelulas(gastoCell: GastosTableViewCell, gasto: Gasto) {
        gastoCell.nomeGasto.text = gasto.nmGasto
        gastoCell.nomeValor.text = "R$\(gasto.vlrGasto)"
        esconderLinhaDoToggle(gastoCell: gastoCell, gasto: gasto)
    }
    
    func exibirLinhaDoToggle(gastoCell: GastosTableViewCell, gasto: Gasto) {
        gastoCell.categoria.text = "\(gasto.nmCategoria)"
        definirImagemDaCategoria(gastoCell: gastoCell, gasto: gasto)
        gastoCell.categoria.isHidden = false
        gastoCell.imgCat.isHidden = false
    }
    
    func esconderLinhaDoToggle(gastoCell: GastosTableViewCell, gasto: Gasto) {
        gastoCell.categoria.isHidden = true
        gastoCell.imgCat.isHidden = true
    }
    
    func definirImagemDaCategoria(gastoCell: GastosTableViewCell, gasto: Gasto) {
        switch gasto.nmCategoria {
        case "Eletrônicos":
            gastoCell.imgCat.image = UIImage(named: "cat-eletronicos-lari")
        case "Transportes":
            gastoCell.imgCat.image = UIImage(named: "cat-transporte-lari")
        case "Entretenimento":
            gastoCell.imgCat.image = UIImage(named: "cat-lazer-lari")
        case "Diversos":
            gastoCell.imgCat.image = UIImage(named: "diversos-lari")
        default:
            gastoCell.imgCat.image = UIImage(named: "diversos-lari")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            gastos.remove(at: indexPath.row)
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
    
    //Passando os dados para a tela "Adicionar Gastos"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let adicionarGastosViewController = segue.destination as! AdicionarGastosViewController
        adicionarGastosViewController.listaDeGastos = self.gastos
    }
    
    // Sobreescrevemos o metodo touchesBegan(_: with:) que é chamado quando tocamos na tela. Isso faz com que você possa para a edição
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Chamamos a view para forçar que a edição pare
        self.view.endEditing(true)
    }
}
