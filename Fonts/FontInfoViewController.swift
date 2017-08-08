//
//  FontInfoViewController.swift
//  Fonts
//
//  Created by Владимир Рыбалка on 08/08/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    var font: UIFont!
    var favorite: Bool = false
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        fontSampleLabel.font = font
        fontSampleLabel.text = "ThiS iS A TeXt sampLe FoR you!"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.isOn = favorite
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slideFontSize(slider: UISlider) {
        let newSize = roundf(slider.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }
    
    @IBAction func toggleFavorite(sender: UISwitch) {
        let favoritesList = FavoritesList.sharedFavoritesList
        if sender.isOn {
            favoritesList.addFavorite(fontName: font.fontName)
        } else {
            favoritesList.removeFavorite(fontName: font.fontName)
        }
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
