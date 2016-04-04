//
//  ViewController.swift
//  Ahorcado
//
//  Created by usu27 on 12/1/16.
//  Copyright © 2016 usu27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imagenes = ["man1","man2","man3","man4","man5","man6","man7"]
    var palabras = ["ERIC","DAVID", "JAIME", "ALEX"]
    var letrausu: Character!
    var incognito: [String] = []
    var random: Int!
    var length: Int!
    var palabraRandom: String!
    var characters:[Character]!
    var palabra: String!
    var acierto = false
    var fallo=0
    var correcto=0;

    @IBAction func enviar(sender: AnyObject) {
        letrausu = Character (letra.text!.uppercaseString)
        comprobar()
    }

    @IBOutlet weak var adivinar: UILabel!
    @IBOutlet weak var letra: UITextField!
    @IBOutlet weak var imagen: UIImageView!
    
    @IBAction func letra02(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicio()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func inicio(){
        
        random = Int(arc4random_uniform(UInt32(4)-0))
        palabraRandom = palabras[random]
        length = palabraRandom.characters.count
        
        for(var i=0; i<length; i++){
            incognito.append("_")
        }
        
        vista()
        characters = [Character](palabraRandom.characters)
        
    }
    
    func vista(){
        adivinar.text=""
        for(var i=0; i<length; i++) {
            adivinar.text = adivinar.text! + " " + String (incognito[i])
        }
    }
    
    func comprobar(){
        for(var i=0; i<length; i++){
            if(characters[i] == letrausu){
                actualizar(i)
                acierto=true
                correcto += 1
                if(correcto==length){fin(true)}
            }
        }
        if(!acierto){
            if(fallo==6){
                fin(false);
            }else{
                imagen.image = UIImage(named:imagenes[fallo])
            }
            fallo += 1
        }
        acierto=false
        vista()
    }
    
    func actualizar(x:Int){
        /*incognito.insert(String(letrausu), atIndex:x)*/
        incognito [x]=String(letrausu)
    
       
    }
    
    func fin(fin: Bool){
        if(!fin){
            let secondViewController: SecondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GameOver") as! SecondViewController
            secondViewController.fin=false
            self.showViewController(secondViewController, sender: self)

        }else{
            let secondViewController: SecondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GameOver") as! SecondViewController
            secondViewController.fin=true
            self.showViewController(secondViewController, sender: self)
        }
    }
}

