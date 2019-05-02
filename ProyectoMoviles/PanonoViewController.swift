//
//  ViewController.swift
//  RA1
//
//  Created by Martin Anzures on 3/11/19.
//  Copyright © 2019 Martin Anzures. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import SwiftSpinner

class PanonoViewController: UIViewController, ARSCNViewDelegate {
    
    var linkRecibido = ""
    var prueba = ""
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet var sceneView: ARSCNView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftSpinner.hide()
        
        
        print("El linkRecibido es: " + linkRecibido)
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        /*
         // Create a new scene
         sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
         //let scene = SCNScene(named: "art.scnassets/ship.scn")!
         let scene = SCNScene()
         let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
         let material = SCNMaterial()
         material.diffuse.contents = UIColor.blue
         let node = SCNNode()
         node.geometry = box
         node.geometry?.materials = [material]
         node.position = SCNVector3(x: 0, y:0, z:0)
         scene.rootNode.addChildNode(node)
         */
        
        /*
         let scene = SCNScene()
         let texto    =    SCNText(string:    "Hola    Mundo",    extrusionDepth:    0.2)
         texto.firstMaterial?.diffuse.contents =    UIColor.black
         let node =    SCNNode(geometry:    texto)
         node.position =    SCNVector3(x:0,y:-1.0,z:-2.0)
         node.scale =    SCNVector3(0.02,    0.02,    0.02)
         scene.rootNode.addChildNode(node)
         */
        
        
        

        
        let imageUrl = URL(string: linkRecibido)!
        
        let scene =    SCNScene()
        let esfera    =    SCNSphere(radius:    20.0)
        let materialTierra =    SCNMaterial()
        
        
        let imageData = try! Data(contentsOf: imageUrl)
        
        
        materialTierra.diffuse.contents =  UIImage(data: imageData)
        materialTierra.isDoubleSided = true
        let tierra    =    SCNNode()
        tierra.geometry =    esfera
        tierra.geometry?.materials =    [materialTierra]
        tierra.position =    SCNVector3(x:0,    y:0,    z:0)
        scene.rootNode.addChildNode(tierra)
        
        
        // Set the scene to the view
        sceneView.scene = scene
        
        
        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
