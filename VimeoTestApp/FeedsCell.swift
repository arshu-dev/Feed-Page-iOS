//
//  FeedsCell.swift
//  VimeoTestApp
//
//  Created by Arshad Parwez on 04/02/17.
//  Copyright © 2017 Arshd Parwez. All rights reserved.
//

import Foundation
import UIKit

class FeedsCell: UITableViewCell {
    
    @IBOutlet weak var videoThumbnail: UIImageView!
    @IBOutlet weak var videoDuration: UILabel!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var postedBy: UILabel!
    @IBOutlet weak var videoPlaysPostedTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
