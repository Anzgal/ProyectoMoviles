//
//  FotosTableViewController.swift
//  ProyectoMoviles
//
//  Created by Martin Anzures on 4/11/19.
//  Copyright © 2019 Alister Estrada Cueto. All rights reserved.
//

import UIKit

class VideosTableViewController: UITableViewController{
    
    var tableArray = ""
    var nuevoArray:[Any]?
    
    
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
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        nuevoArray = JSONParseArray(tableArray)
        
        //print(self.tableArray)
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension VideosTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        let objetoDatos = nuevoArray![indexPath.row] as! [String: Any]
        let s:String = objetoDatos["Video"] as! String
        cell.textLabel?.text=s
        return cell
        
        // Configure the cell...
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.nuevoArray!.count
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let siguiente = segue.destination as! VideosViewViewController
        
        //let prueba = textoFila
        //siguiente.linkRecibido = self.tableArray[IndexPath.row]
        //siguiente.linkRecibido = "http://martinmolina.com.mx/201911/imagesCDT/101Panono%20-%20Cabina%20de%20control.jpg"
        
        //print("El textoFila es: " + textoFila)
        
        /*
         if segue.identifier == "showImage" {
         
         let siguiente = segue.destination as! PanonoViewController
         let indexPath = sender as! IndexPath
         siguiente.linkRecibido = sections[indexPath.section].items[indexPath.row]
         }*/
        
        
        
        
        let indice = self.tableView.indexPathForSelectedRow?.row
        
        
        let objetoDatos = nuevoArray![indice!] as! [String: Any]
        let s:String = objetoDatos["Liga"] as! String
        
        siguiente.linkRecibido = s
    }
    
}
