//
//  Gasto.swift
//  Gamic
//
//  Created by Student on 16/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import Foundation

class Gasto {
    
    var nmGasto: String
    var vlrGasto: Double
    var nmCategoria: String
    
    init(nmGasto: String, vlrGasto: Double, nmCategoria: String) {
        self.nmGasto = nmGasto
        self.vlrGasto = vlrGasto
        self.nmCategoria = nmCategoria
    }
}
class GastoDAO {
    
    var listaDeGastos = [Gasto]()
    
    init() {
        listaDeGastos.append(Gasto(nmGasto: "Bike", vlrGasto: 450.00, nmCategoria: "Transportes"))
        listaDeGastos.append(Gasto(nmGasto: "Celular", vlrGasto: 1000.00, nmCategoria: "Eletrônicos"))
        listaDeGastos.append(Gasto(nmGasto: "Notebook", vlrGasto: 1500.00, nmCategoria: "Eletrônicos"))
    }
    
    func getListaDeGastos() -> [Gasto] {
        return listaDeGastos
    }
    
    func setNovoGasto(gasto: Gasto) {
        listaDeGastos.append(gasto)
    }
}
