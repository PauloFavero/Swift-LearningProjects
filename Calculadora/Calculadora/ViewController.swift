//
//  ViewController.swift
//  Calculadora
//
//  Created by Gustavo Lima on 18/03/2017.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

/// View Controller que implementa CalculatorDisplay
/// para exibir o resultado da Calculadora
class ViewController: UIViewController, CalculatorDisplay {

    /// instancia strong da calculadora o uso defileprivate 
    /// garante somente acesso interno
    fileprivate var calculator = Calculator()
    
    /// Label que exibe o resultado
    @IBOutlet weak var resultLabel: UILabel!
    
    /// Action quando qualquer digito numérico for pressionado
    @IBAction func numberPressed(_ sender: UIButton) {

        if  let value = sender.titleLabel?.text
        {
            self.calculator.input(digit: Float(value)!)
        }
    }
    
    /// Action quando qualquer operação for pressionada
    @IBAction func operationPressed(_ sender: UIButton) {
        
        let operation = (sender.titleLabel?.text)! as String
        
        self.calculator.operation(operation)
        
    }
    
    /// Action quando o "C" (Clear) for pressionado
    @IBAction func clearPressed(_ sender: UIButton) {
        self.calculator.clear()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Se coloca como delegate
        self.calculator.delegate = self
    }

    func display(result:Float)
    {
        /// Mostra o resultado Float sem nenhuma casa decimal
        self.resultLabel.text =  String(format:"%0.0f",result)
    }


    /// Sobreescrevendo o estilo da barra de status para deixar ela clara
    /// pois nossa calculadora tem o fundo escuro
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

