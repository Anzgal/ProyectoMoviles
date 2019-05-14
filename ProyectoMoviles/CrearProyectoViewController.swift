//
//  CrearProyectoViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto on 3/21/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit
import EventKit
import UserNotifications
import Firebase
import FirebaseDatabase

class CrearProyectoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nombreProyecto: UITextField!
    
    @IBOutlet weak var inicio: UIDatePicker!
    
    @IBOutlet weak var actividades: UITextField!
    
    @IBOutlet weak var fin: UIDatePicker!
    
    @IBOutlet weak var integrantes: UITextField!
    
    @IBOutlet weak var roles: UITextField!
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        self.actividades.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ actividades: UITextField) -> Bool{
        
        actividades.resignFirstResponder()
        return(true)
    }
    
    
    @IBAction func GuardarDatos(_ sender: Any) {
        
        //Para la identificación del path se utilizará el User Id del usuario actual
        let userid = Auth.auth().currentUser?.uid
        //Obtener el texto introducido por el usuario
        //Hace falta verificar que el texto no sea nulo
        let np:String = self.nombreProyecto.text!
        let it:String = self.integrantes.text!
        let rol:String = self.roles.text!
        let act:String = self.actividades.text!
        let fi:Date = self.inicio.date
        let ft:Date = self.fin.date
        
        
        //Relizar la actualización en la BD
        ref.child("Usuarios/"+userid!).updateChildValues(["nombreProyecto":np, "inicio":fi, "actividades":act, "roles":rol, "fin":ft, "integrantes":it])
        //Notificar al usuario que la actualización fue exitosa
        let alert = UIAlertController(title: "Guardar", message: "Los datos se almacenaron exitosamente", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "continue", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        
        
    }
    
    @IBAction func CargarDatos(_ sender: Any) {
        /*lectura*/
        
        //Para la identificación del path se utilizará el User Id del usuario actual
        let userid = Auth.auth().currentUser?.uid
        // El método .observeSingleEvent realiza una consulta puntual de los valores de los atributos hijos del path
        ref.child("Usuarios").child(userid!).observeSingleEvent(of: .value){
            (snapshot) in
            let datos = snapshot.value as? [String:Any]
            
            self.nombreProyecto.text = datos?["nombreProyecto"] as! String
            self.integrantes.text = datos?["integrantes"] as! String
            self.roles.text = datos?["roles"] as! String
            self.fin.date = datos?["fin"] as! Date
            self.inicio.date = datos?["inicio"] as! Date
            self.actividades.text = datos?["actividades"] as! String
            
            
        }
        
        
        
        
    }
    
    
    @IBAction func CrearEvento(_ sender: UIButton) {
    
        
        let content = UNMutableNotificationContent()
        content.title = self.nombreProyecto.text!
        content.subtitle = self.actividades.text!
        content.body = self.actividades.text!
        content.badge = 1
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "PROYECTO CREADO", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        let eventStore:EKEventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { (granted ,error) in
            
            if(granted) && (error == nil){
                
                print("granted \(granted)")
                print("error \(error)")
                
                let event:EKEvent = EKEvent(eventStore: eventStore)
                event.title = self.nombreProyecto.text
                event.startDate = self.inicio.date
                event.endDate = self.fin.date
                event.notes = self.actividades.text
                event.calendar = eventStore.defaultCalendarForNewEvents
                
                do{
                    try eventStore.save(event, span: .thisEvent)
                }catch let error as NSError{
                    
                    print("error : \(error)")
                }
                print ("Save Event")
                
                
                
                
            }else{
                print("error : \(error)")
                
            }
            
            
        }
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
