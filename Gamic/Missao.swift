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
    static func getMissoes() -> [Missao] {
        return [
            Missao(nmMissao: "Livros do Harry Potter", vlrMissao: 140.00, qtdPorDia: 5, qtdDeDias: 18),
            Missao(nmMissao: "Playstation 4 Pro", vlrMissao: 1800.00, qtdPorDia: 20, qtdDeDias: 30),
            Missao(nmMissao: "Jogo da Vida", vlrMissao: 129.99, qtdPorDia: 30, qtdDeDias: 6)
        ]
    }
}
