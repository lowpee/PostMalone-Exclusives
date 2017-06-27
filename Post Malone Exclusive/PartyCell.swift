//
//  PartyCell.swift
//  Post Malone Exclusive
//
//  Created by Lord Lopie on 6/14/17.
//  Copyright © 2017 DivLabs. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

   
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock: PartyRock){
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global() .sync {
                    self.videoPreviewImage .image = UIImage(data:data)
                    
                }
                
            } catch{
                //handle error
            }
        }
    }

}
