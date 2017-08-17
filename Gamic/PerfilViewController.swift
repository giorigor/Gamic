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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Chamamos a view para forçar que a edição pare
        self.view.endEditing(true)
    }
}
