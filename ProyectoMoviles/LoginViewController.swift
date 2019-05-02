//
//  LoginViewController.swift
//  ProyectoMoviles
//
//  Created by Martin Anzures on 5/1/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func registrarUsuario(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: user.text!, password: password.text!){(user, error) in
            
            if error != nil{
                print(error!)
            }
            else{
                print("Registro de usuario exitoso")
                self.performSegue(withIdentifier: "goToDetalles", sender: self)
            }
            
        }
    }
    @IBAction func hacerLogin(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: user.text!, password: password.text!){
            (user, error) in
            if error != nil{
                print(error!)
                let alert = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "continue", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }else{
                print("Login exitoso")
                self.performSegue(withIdentifier: "goToDetalles", sender: self)
                
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
