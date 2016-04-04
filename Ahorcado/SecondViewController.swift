//
//  SecondViewController.swift
//  Ahorcado
//
//  Created by usu27 on 27/1/16.
//  Copyright © 2016 usu27. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var titulo: UILabel!
    
    var fin: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(!fin){
            titulo.text = "GAME OVER"
             imagen.image = UIImage(named:"man7.png")
        }else{
            titulo.text = "YOU WIN"
            imagen.image = UIImage(named:"win.png")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
