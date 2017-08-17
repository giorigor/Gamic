//
//  Perfil.swift
//  Gamic
//
//  Created by Eric Ribeiro on 17/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import Foundation

class Rank {
    
    var nickname: String
    var nmImagem: String
    var posicao: Int
    var exp: Double
    
    init(nickname: String, nmImagem: String, posicao: Int, exp: Double) {
        self.nickname = nickname
        self.nmImagem = nmImagem
        self.posicao = posicao
        self.exp = exp
    }
}

class RankDAO {
    static func getRank() -> [Rank] {
        return [
            Rank(nickname: "Bessie Vaughan", nmImagem: "girl", posicao: 1, exp: 54000),
            Rank(nickname: "Paulo Ferreira", nmImagem: "man", posicao: 2, exp: 47564),
            Rank(nickname: "Diego Barbosa", nmImagem: "man-1", posicao: 3, exp: 45321),
            Rank(nickname: "Leornardo Martins", nmImagem: "man-2", posicao: 4, exp: 32129),
            Rank(nickname: "Alice Ribeiro", nmImagem: "girl-1", posicao: 5, exp: 27647),
            Rank(nickname: "Vinicius Lima", nmImagem: "man-3", posicao: 6, exp: 21995),
            Rank(nickname: "Tomas Cavalcanti", nmImagem: "man-4", posicao: 7, exp: 16500)
        ]
    }
}
