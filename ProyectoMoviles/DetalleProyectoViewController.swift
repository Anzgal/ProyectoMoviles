//
//  DetalleProyectoViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto on 4/11/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit

class DetalleProyectoViewController: UIViewController {var nombreRecibido = ""
    var integrantesRecibido = ""
    var rolesRecibido = ""
    var inicioRecibido = ""
    var finRecibido = ""
    var actividadesRecibido = ""
  
    
    
    
   
    
    @IBOutlet weak var nombreSeleccionado: UILabel!
    @IBOutlet weak var integrantesSeleccionado: UILabel!
    @IBOutlet weak var finSeleccionado: UILabel!
    @IBOutlet weak var inicioSeleccionado: UILabel!
    @IBOutlet weak var rolesSeleccionado: UILabel!
    @IBOutlet weak var actividadesSeleccionado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        integrantesSeleccionado.text = integrantesRecibido
        rolesSeleccionado.text = rolesRecibido
        inicioSeleccionado.text = inicioRecibido
        finSeleccionado.text = finRecibido
        actividadesSeleccionado.text = actividadesRecibido
        nombreSeleccionado.text = nombreRecibido
       
    }
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        /*
         let siguiente = segue.destination as! PanonoViewController
         // Pass the selected object to the new view controller.
         
         siguiente.linkRecibido = panonoRecibido
         */
        
        if segue.identifier == "panonoSegue" {
            let siguiente = segue.destination as! PanonoViewController
            siguiente.linkRecibido = panonoRecibido
        } else if segue.identifier == "gearSegue" {
            let siguiente = segue.destination as! GearViewController
            siguiente.linkRecibido = gearRecibido
        }
    }*/
    
    
}
