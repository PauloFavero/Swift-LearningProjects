//
//  InfoViewController.swift
//  Calculadora
//
//  Created by Gustavo Lima on 19/03/2017.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

/// View controller de informações apenas para ilustrar o uso
/// de transição de telas fazendo o uso de segue
class InfoViewController: UIViewController {

    /// Imagem que terá o logo
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Logo que é acarrecado programaticamente apenas para ilustrar
        // o uso de uma imagem armazenada nos Assets
        self.imageView.image = UIImage(named: "LogoBEPiD")
    }
    
    /// Ação quando o botão ok é pressionado
    @IBAction func okPressed(_ sender: Any) {
        
        // apenas dispensa este view controller sem uso de bloco de completion
        // com isso voltaremos para o view controller anterior
        self.dismiss(animated: true, completion: nil)
    }

    
}
