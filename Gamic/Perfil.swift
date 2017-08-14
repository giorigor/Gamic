//
//  Perfil.swift
//  Gamic
//
//  Created by Eric Ribeiro on 14/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import Foundation

class Perfil {
    
    var nome: String
    var vlrSaldo: Double
   
    init(nome: String, vlrSaldo: Double) {
        self.nome = nome
        self.vlrSaldo = vlrSaldo
    }
}

class PerfilDAO {
    static func getPerfil() -> Perfil {
        return Perfil(nome: "Eric Ribeiro", vlrSaldo: 440.00)
    }
}
