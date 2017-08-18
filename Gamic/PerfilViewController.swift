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
    
    var perfil = PerfilDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let exp = String(format: "%.0f", perfil.getPerfil().exp)
        let limiteDoNivel: Double = 10000
        let limiteDoNivelStr = String(format: "%.0f", limiteDoNivel)
        nivel.text = "Nível \(perfil.getPerfil().nivel)"
        barraDeExp.progress = Float(perfil.getPerfil().exp/limiteDoNivel)
        quantidadeDeExp.text = "\(exp)/\(limiteDoNivelStr)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Chamamos a view para forçar que a edição pare
        self.view.endEditing(true)
    }
}
