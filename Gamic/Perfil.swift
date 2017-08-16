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
    var nivel: Int
    var vlrSaldo: Double
    var exp: Double
   
    init(nome: String, nivel: Int, vlrSaldo: Double, exp: Double) {
        self.nome = nome
        self.nivel = nivel
        self.vlrSaldo = vlrSaldo
        self.exp = exp
    }
}

class PerfilDAO {
    static func getPerfil() -> Perfil {
        return Perfil(nome: "Eric Ribeiro", nivel: 2, vlrSaldo: 440.00, exp: 6200)
    }
}
