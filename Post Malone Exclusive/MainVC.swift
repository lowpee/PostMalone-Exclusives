//
//  ViewController.swift
//  Post Malone Exclusive
//
//  Created by Lord Lopie on 6/14/17.
//  Copyright © 2017 DivLabs. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL:"https://i.ytimg.com/vi/SLsTskih7_I/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SLsTskih7_I\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "White Iverson")
        
        let p2 = PartyRock(imageURL:"http://media.gq.com/photos/58862ab7f71fc66b7720833b/3:2/w_560/Screen%20Shot%202017-01-23%20at%2011.06.59%20AM.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SC4xMk98Pdc\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Congratulations")
        
        let p3 = PartyRock(imageURL:"https://i.ytimg.com/vi/YIHRlWmeodY/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/YIHRlWmeodY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "On God")
 
        let p4 = PartyRock(imageURL:"https://complex-res.cloudinary.com/image/upload/uogfou0ppzksgoal4jzd", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/i8Zi1DM7iR4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Too Young")
        
        let p5 = PartyRock(imageURL:"https://i1.sndcdn.com/artworks-000141114085-41c3k0-t500x500.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SGUzkDfHvVo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Boy Bandz")
        
        let p6 = PartyRock(imageURL:"https://s-media-cache-ak0.pinimg.com/originals/bf/0a/35/bf0a35633bc45bc667543c7e4fbfed64.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/rxfbW7gX3kY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Came Up")
        
        let p7 = PartyRock(imageURL:"https://img.washingtonpost.com/rf/image_1484w/2010-2019/WashingtonPost/2016/02/02/Style/Images/postmalone2.jpeg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KfuukDHC0d8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Mood")
        
        let p8 = PartyRock(imageURL:"https://hypebeast.imgix.net/http%3A%2F%2Fhypebeast.com%2Fimage%2F2016%2F04%2Fpost-malone-go-flex-official-video-0.jpg?fit=max&fm=pjpg&ixlib=php-1.1.0&q=90&w=960&s=d036110c20fb957d9155da9af14d4bc3", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tQjsAJhsSw8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Go Flex")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        partyRocks.append(p6)
        partyRocks.append(p7)
        partyRocks.append(p8)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier:  "PartyCell", for: indexPath) as? PartyCell{
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
           
            
        } else {
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC{
            
            if let party = sender as? PartyRock{
                destination.partyRock = party
            }
        }
        
    }

}

