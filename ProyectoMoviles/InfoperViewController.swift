//
//  InfoperViewController.swift
//  ProyectoMoviles
//
//  Created by Martin Anzures on 5/2/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class InfoperViewController: UIViewController {
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var matricula: UITextField!
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var carrera: UITextField!
    //Definición de referencia a la BD
    let ref = Database.database().reference()
    
    @IBAction func guardarDatos(_ sender: UIButton) {
        //Para la identificación del path se utilizará el User Id del usuario actual
        let userid = Auth.auth().currentUser?.uid
        //Obtener el texto introducido por el usuario
        //Hace falta verificar que el texto no sea nulo
        let n:String = self.nombre.text!
        let m:String = self.matricula.text!
        let co:String = self.correo.text!
        let ca:String = self.carrera.text!


        //Relizar la actualización en la BD
        ref.child("Usuarios/"+userid!).updateChildValues(["Nombre":n, "Matricula":m, "Correo":co, "Carrera":ca])
        //Notificar al usuario que la actualización fue exitosa
        let alert = UIAlertController(title: "Guardar", message: "Los datos se almacenaron exitosamente", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "continue", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ actividades: UITextField) -> Bool{
        
        actividades.resignFirstResponder()
        return(true)
    }
    
    
    
    @IBAction func cargarDatos(_ sender: UIButton) {
        /*lectura*/
        
        //Para la identificación del path se utilizará el User Id del usuario actual
        let userid = Auth.auth().currentUser?.uid
        // El método .observeSingleEvent realiza una consulta puntual de los valores de los atributos hijos del path
        ref.child("Usuarios").child(userid!).observeSingleEvent(of: .value){
            (snapshot) in
            let datos = snapshot.value as? [String:Any]
            
            self.nombre.text = datos?["Nombre"] as! String
            self.matricula.text = datos?["Matricula"] as! String
            self.correo.text = datos?["Correo"] as! String
            self.carrera.text = datos?["Carrera"] as! String

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
