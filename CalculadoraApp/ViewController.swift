//
//  ViewController.swift
//  CalculadoraApp
//
//  Created by Daniel on 31/03/26.
//



import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numero1TextField: UITextField!
    @IBOutlet weak var numero2TextField: UITextField!
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var botaoSomar: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultadoLabel.text = ""
        
        resultadoLabel.layer.cornerRadius = 10
        resultadoLabel.clipsToBounds = true
        resultadoLabel.backgroundColor = .systemGray5
        resultadoLabel.textAlignment = .center
        
        botaoSomar.layer.cornerRadius = 10
        botaoSomar.clipsToBounds = true
        
        numero1TextField.keyboardType = .numberPad
        numero2TextField.keyboardType = .numberPad
        
        numero1TextField.delegate = self
        numero2TextField.delegate = self
    }

    @IBAction func soma(_ sender: Any) {
        guard let n1 = Int(numero1TextField.text ?? ""),
              let n2 = Int(numero2TextField.text ?? "") else {
            resultadoLabel.text = "Digite números válidos"
            return
        }

        resultadoLabel.text = "\(n1 + n2)"
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
