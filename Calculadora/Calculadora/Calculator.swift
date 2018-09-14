//
//  Calculator.swift
//  Calculadora
//
//  Created by Gustavo Lima on 18/03/2017.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import UIKit

/**
 Protocolo para separar a lógica de Display do objeto calculadora
 detalhe que ele extende NSObjectProtocol com o propósito de permitir
 a criação de uma variável weak no atributo delegate
 */
protocol CalculatorDisplay: NSObjectProtocol{
    
    func display(result:Float)
}


/**
 Calculadora Básica com operações simples
 */
class Calculator: NSObject {

    // o private(set) nos apributos public abaixo
    // garante que será uma propriedade readonly externamente
    // isto é externamente pode se ler o valor mas
    // não atribuí-lo
    
    // MARK: Atributos
    
    /// Resutado final calculado 
    public private(set) var result: Float
    
    /// Número que está sendo inserido para
    /// executar a próxima operaçao
    public private(set) var number: Float
    
    /// Operação a ser executada usando o número 
    /// e o resultado acumulado
    public private(set) var operation: String
    
    /// Delegate para isolar a lógica de exibição
    /// É muito importante que o delegate seja weak
    /// para não reter o objeto
    public weak var delegate: CalculatorDisplay?
    
    
    /**
     Construtor padrão da Classe
    */
    public override init()
    {
        self.result = Float()
        self.number = Float()
        self.operation = "="
    }
    
    ///
    /// Chama a função para exibir o resultado na tela
    ///
    /// - parameter result : Float com o valor do resultado a ser exibido
    ///
    fileprivate func displayResult(_ result:Float)
    {
        // caso tenha algum delegate definido
        if let delegate = self.delegate {
            // chama a funcão de display do protocolo
            delegate.display(result: result)
        }
    }
    
    // MARK: Operações
    /**
      Limpa e reinicia os atributos
     */
    func clear()
    {
        self.result = 0
        self.number = 0
        self.operation = "="

        displayResult(self.result)
    }

    /**
     Executa uma operação básica da calculadora
     
     - parameter op : String com a operação a ser executada
    */
    func operation(_ op:String){
        
        // TODO: Implementar "%" e "+/-"

        // Seleciona e executa a operação corrente
        switch self.operation {
            
        case "=":
            self.result = self.number
            break
        case "+":
            self.result += self.number
            break
        case "-":
            self.result -= self.number
            break
        case "x":
            self.result *= self.number
            break
        case "/":
            self.result /= self.number
            break
        default:
            // Operação não implementada
            print("error:\(self.operation)")
            break
        }
        
        // Reinicia o valor de número após cada operação
        self.number = 0
        
        displayResult(self.result)
        
        // Caso seja a operação de "=" reinicia o resultado
        if  op == "="
        {
            self.result = 0
        }
        
        // armazena a próxima operação
        self.operation = op
    }
    
    /**
     Insere um dígito no número corrente que a calculadora está exibindo
     
     - parameter digit : dígito a ser acrescentado o numero
     */
    func input(digit:Float)
    {
        // TODO: Implementar "." 
        
        // para cada digito novo é considerado uma unidade, os anteriores
        // são multiplicados por 10 para virarem dezenas, centenas, etc...
        self.number = self.number * 10 + digit
        
        displayResult(self.number)
    }
    
    
    
}
