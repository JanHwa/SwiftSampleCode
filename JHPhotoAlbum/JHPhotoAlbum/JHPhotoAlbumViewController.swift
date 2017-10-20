//
//  JHPhotoAlbumViewController.swift
//  JHPhotoAlbum
//
//  Created by Justin on 2017/9/19.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit

class JHPhotoAlbumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
