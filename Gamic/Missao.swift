//
//  Missao.swift
//  Gamic
//
//  Created by Eric Ribeiro on 14/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import Foundation

class Missao {
    
    var nmMissao: String
    var vlrMissao: Double
    var qtdPorDia: Double
    var qtdDeDias: Int
    
    init(nmMissao: String, vlrMissao: Double, qtdPorDia: Double, qtdDeDias: Int) {
        self.nmMissao = nmMissao
        self.vlrMissao = vlrMissao
        self.qtdPorDia = qtdPorDia
        self.qtdDeDias = qtdDeDias
    }
}

class MissaoDAO {
    
    var listaDeMissoes = [Missao]()
    
    init() {
        listaDeMissoes.append(Missao(nmMissao: "Livros do Harry Potter", vlrMissao: 140.00, qtdPorDia: 5, qtdDeDias: 18))
        listaDeMissoes.append(Missao(nmMissao: "Playstation 4 Pro", vlrMissao: 1800.00, qtdPorDia: 20, qtdDeDias: 30))
        listaDeMissoes.append(Missao(nmMissao: "Monopoly", vlrMissao: 129.99, qtdPorDia: 30, qtdDeDias: 6))
        listaDeMissoes.append(Missao(nmMissao: "Minecraft - Story Mode", vlrMissao: 60.00, qtdPorDia: 3, qtdDeDias: 20))
        listaDeMissoes.append(Missao(nmMissao: "A Era dos Extremos", vlrMissao: 40.00, qtdPorDia: 4, qtdDeDias: 10))
    }
    
    func getListaDeMissoes() -> [Missao] {
        return listaDeMissoes
    }
    
    func setNovaMissao(missao: Missao) {
        listaDeMissoes.append(missao)
    }
}
