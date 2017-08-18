//
//  PerfilViewController.swift
//  Gamic
//
//  Created by Student on 17/08/17.
//  Copyright © 2017 Eric Ribeiro. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var insiraSeuNome: UITextField!
    @IBOutlet weak var insiraSuaMesada: UITextField!
    @IBOutlet weak var nivel: UILabel!
    @IBOutlet weak var barraDeExp: UIProgressView!
    @IBOutlet weak var quantidadeDeExp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let perfil = PerfilDAO.getPerfil()
        let exp = String(format: "%.0f", perfil.exp)
        let limiteDoNivel: Double = 10000
        let limiteDoNivelStr = String(format: "%.0f", limiteDoNivel)
        nivel.text = "Nível \(perfil.nivel)"
        barraDeExp.progress = Float(perfil.exp/limiteDoNivel)
        quantidadeDeExp.text = "\(exp)/\(limiteDoNivelStr)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Chamamos a view para forçar que a edição pare
        self.view.endEditing(true)
    }
}
