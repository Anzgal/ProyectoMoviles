//
//  DetallePerritoViewController.swift
//  ProyectoMoviles
//
//  Created by Martin Anzures on 2/18/19.
//  Copyright © 2019 Martin Anzures. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {
    
    var razaRecibida = ""
    
    @IBOutlet weak var razaSeleccionada: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        razaSeleccionada.text = razaRecibida
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
