//
//  ListaPerritosTableViewController.swift
//  ProyectoMoviles
//
//  Created by Martin Anzures on 2/18/19.
//  Copyright © 2019 Martin Anzures. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var perritosFiltrados = [Any]()
    let searchController = UISearchController(searchResultsController: nil)
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == "" {
            perritosFiltrados = perritosObj!
        }else {
            perritosFiltrados = perritosObj!.filter{
                let objetoPerrito=$0 as! [String:Any]
                let s:String = objetoPerrito ["raza"] as! String
                
                return(s.lowercased().contains(searchController.searchBar.text!.lowercased()))
            }
        }
        
        self.tableView.reloadData()
    }
    
    
    let perritosStringURL = "http://martinmolina.com.mx/201911/data/datosPerritos.json"
    
    private let perritos = ["Pug", "Labrador", "Pastor Alemán", "Gran Danés", "French Poodle", "San Bernardo", "Kobe", "Dálmata", "Schnauzer", "Puddle"]
    
    
    let perritosJSON = "[{\"raza\" : \"pug\",\"edad\" : \"2\"}, {\"raza\" : \"San Bernardo\",\"edad\" : \"1\"},{\"raza\" : \"Chihuaha\",\"edad\" : \"5\"}]"
    var perritosObj: [Any]?
    
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
        let perritosURL = URL(string: perritosStringURL)
        let data = try? Data(contentsOf: perritosURL!)
        
        perritosObj = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [AnyObject]
        
        perritosFiltrados = perritosObj!
        
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
        return perritosFiltrados.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath)
        
        // Configure the cell...
        let objetoPerrito = perritosFiltrados [indexPath.row] as! [String:Any]
        let raza:String = objetoPerrito["raza"] as! String
        cell.textLabel?.text = raza
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
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
        
        
        
        let siguiente = segue.destination as! DetalleViewController
        let indice = self.tableView.indexPathForSelectedRow?.row
        
        let objetoPerrito = perritosFiltrados [indice!] as! [String:Any]
        let raza:String = objetoPerrito["raza"] as! String
        
        siguiente.razaRecibida = raza
    }
    
    
}
