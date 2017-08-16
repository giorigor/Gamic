//
//  Conquistas.swift
//  Gamic
//
//  Created by Eric Ribeiro on 16/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import Foundation

class Conquistas {
    
    var descricao: String
    
    init(descricao: String) {
        self.descricao = descricao
    }
}

class ConquistasDAO {
    static func getConquistas() -> [Conquistas] {
        return [
            Conquistas(descricao: "Completou 1 missão - 500exp"),
            Conquistas(descricao: "Inseriu 5 gastos do dia - 1200exp"),
            Conquistas(descricao: "Economizou 50% da mesada - 2500exp"),
            Conquistas(descricao: "Completou 3 missões - 2000exp")
        ]
    }
}
