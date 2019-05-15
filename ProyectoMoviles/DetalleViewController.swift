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
    var equipamientoRecibido = [String] ()
    var fotosRecibido = ""
    var emailRecibido = ""
    var videos360Recibido = ""
    var videosRecibido = ""
    var modelosRecibido = [String] ()
    //var panonoRecibido = ""
    //var gearRecibido = ""
    

   
    @IBOutlet weak var nombreSeleccionado: UILabel!
    @IBOutlet weak var pisoSeleccionado: UILabel!
    @IBOutlet weak var horarioSeleccionado: UILabel!
    @IBOutlet weak var salonSeleccionado: UILabel!
    //@IBOutlet weak var equipamientoSeleccionado: UILabel!
    @IBOutlet weak var emailSeleccionado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        print(equipamientoRecibido)
        // Do any additional setup after loading the view.
        nombreSeleccionado.text = nombreRecibido
        pisoSeleccionado.text = pisoRecibido
        horarioSeleccionado.text = horarioRecibido
        salonSeleccionado.text = salonRecibido
        //equipamientoSeleccionado.text = equipamientoRecibido
        emailSeleccionado.text = emailRecibido
    }
    
    
    
   
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
        /*
        let siguiente = segue.destination as! FotosTableViewController
     // Pass the selected object to the new view controller.
        
        siguiente.tableArray = equipamientoRecibido
        */
        
        if segue.identifier == "fotosTableSegue" {
            let siguiente = segue.destination as! FotosTableViewController
            siguiente.tableArray = fotosRecibido
        } else if segue.identifier == "equipamientoTableSegue" {
            let siguiente = segue.destination as! EquipamientoTableViewController
            siguiente.tableArray = equipamientoRecibido
        }else if segue.identifier == "videos360TableSegue" {
            let siguiente = segue.destination as! Videos360TableViewController
            siguiente.tableArray = videos360Recibido
        }else if segue.identifier == "videosTableSegue" {
            let siguiente = segue.destination as! VideosTableViewController
            siguiente.tableArray = videosRecibido
        }else if segue.identifier == "modelosTablaSegue" {
            let siguiente = segue.destination as! ModelosTableViewController
            siguiente.tableArray = modelosRecibido
        }else if segue.identifier == "contactoLlamada" {
            let siguiente = segue.destination as! LlamadaYCorreoViewController
            siguiente.correoRecibido = emailRecibido
        }
        
     }
    
    
}
