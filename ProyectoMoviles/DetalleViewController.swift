//
//  DetallePerritoViewController.swift
//  ProyectoMoviles
//
//  Created by Martin Anzures on 2/18/19.
//  Copyright © 2019 Martin Anzures. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {
    
    var nombreRecibido = ""
    var pisoRecibido = ""
    var horarioRecibido = ""
    var salonRecibido = ""
    var equipamientoRecibido = ""
    var emailRecibido = ""
    var panonoRecibido = ""
    var gearRecibido = ""
    
    @IBOutlet weak var nombreSeleccionado: UILabel!
    @IBOutlet weak var pisoSeleccionado: UILabel!
    @IBOutlet weak var horarioSeleccionado: UILabel!
    @IBOutlet weak var salonSeleccionado: UILabel!
    @IBOutlet weak var equipamientoSeleccionado: UILabel!
    @IBOutlet weak var emailSeleccionado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nombreSeleccionado.text = nombreRecibido
        pisoSeleccionado.text = pisoRecibido
        horarioSeleccionado.text = horarioRecibido
        salonSeleccionado.text = salonRecibido
        equipamientoSeleccionado.text = equipamientoRecibido
        emailSeleccionado.text = emailRecibido
    }
    
    
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
     }
    
    
}
