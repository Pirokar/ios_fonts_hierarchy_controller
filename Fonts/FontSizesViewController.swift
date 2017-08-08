//
//  FontSizesViewController.swift
//  Fonts
//
//  Created by Владимир Рыбалка on 08/08/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {
    var font: UIFont!
    
    private static let pointSizes: [CGFloat] = [9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144]
    private let cellIdentifier = "FontNameAndSize"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        let cellPointSize = preferredTableViewFont.pointSize
        tableView.estimatedRowHeight = cellPointSize
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FontSizesViewController.pointSizes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text = "\(FontSizesViewController.pointSizes[indexPath.row]) point"
        
        return cell
    }

    func fontForDisplay(atIndexPath indexPath: IndexPath) -> UIFont {
        let pointSize = FontSizesViewController.pointSizes[indexPath.row]
        return font.withSize(pointSize)
    }
}
