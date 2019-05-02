//
//  ViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto and Martín Anzures on 3/19/19.
// Huevos profe 2 y MArtin y Alister
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
    }
    
    @IBAction func logout(_ sender: UIButton) {
        do{
            //Método para cirre de sesión
            try Auth.auth().signOut()
            //Regresa a la vista raíz del navegador
            navigationController?.popToRootViewController(animated: true)
            print("Logout exitoso")
            
        }catch{
            print("Error en logout")
            let alert = UIAlertController(title: "Error", message: "Error en Logout", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "continue", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }*/


    
}

