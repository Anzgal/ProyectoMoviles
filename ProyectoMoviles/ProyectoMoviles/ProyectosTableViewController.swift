//
//  ProyectosTableViewController.swift
//  ProyectoMoviles
//
//  Created by Alister Estrada Cueto on 4/10/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit

class ProyectosTableViewController: UITableViewController, UISearchResultsUpdating{
    
    var datosFiltrados = [Any]()
    let searchController = UISearchController(searchResultsController: nil)
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == "" {
            datosFiltrados = datosObj!
        }else {
            datosFiltrados = datosObj!.filter{
                let objetoDato=$0 as! [String:Any]
                let s:String = objetoDato ["Nombre del proyecto"] as! String
                
                return(s.lowercased().contains(searchController.searchBar.text!.lowercased()))
            }
        }
        
        self.tableView.reloadData()
    }
    
    
    let datosStringURL = "http://martinmolina.com.mx/201911/data/UbicaTec/proyectos.json"
    
    
    var datosObj: [Any]?
    
    func JSONParseArray(_ string: String) -> [AnyObject]{
        if let data = string.data(using: String.Encoding.utf8){
            
            do{
                
                if let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)  as? [AnyObject] {
                    return array
                }
            }catch{
                
                print("error")
                //handle errors here
                
            }
        }
        return [AnyObject]()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datosURL = URL(string: datosStringURL)
        let data = try? Data(contentsOf: datosURL!)
        
        datosObj = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [AnyObject]
        
        datosFiltrados = datosObj!
        
        searchController.searchResultsUpdater = self
        
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.hidesNavigationBarDuringPresentation = false
        
        self.definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datosFiltrados.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "proyectos", for: indexPath)
        
        // Configure the cell...
        let objetoDato = datosFiltrados [indexPath.row] as! [String:Any]
        let nombre:String = objetoDato["Nombre del proyecto"] as! String
        cell.textLabel?.text = nombre
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
        
        
        
        let siguiente = segue.destination as! DetalleProyectoViewController
        let indice = self.tableView.indexPathForSelectedRow?.row
        
        let objetoDato = datosFiltrados [indice!] as! [String:Any]
        
        
        
        let nombre:String = objetoDato["Nombre del proyecto"] as! String
        let roles:String = objetoDato["Roles"] as! String
        let integrantes:String = objetoDato["Integrantes"] as! String
        let inicioFecha:String = objetoDato["Fecha de Inicio"] as! String
        let finFecha:String = objetoDato["Fecha de Termino"] as! String
        let actividades:String = objetoDato["Lista de actividades"] as! String
       
        
        
        siguiente.nombreRecibido = nombre
        siguiente.finRecibido = finFecha
        siguiente.rolesRecibido = roles
        siguiente.inicioRecibido = inicioFecha
        siguiente.actividadesRecibido = actividades
        siguiente.integrantesRecibido = integrantes
       
        
    }
    
    
    
}
