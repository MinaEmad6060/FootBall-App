//
//  TeamDetailsViewController.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import UIKit

struct TeamPlayerViewData{
    var image: String?
    var name: String?
    var position: String?
    var nationality: String?
}


struct TeamInformationViewData{
    var image: String?
    var longName: String?
    var shortName: String?
    var founded: String?
    var stadium: String?
    var colors: String?
    var website: String?
}



class TeamDetailsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var playersTable: UITableView!
    

    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playersTable.delegate = self
        playersTable.dataSource = self

        let nibCustomCell = UINib(nibName: "PlayerViewCell", bundle: nil)
        playersTable.register(nibCustomCell, forCellReuseIdentifier: "teamPlayersCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamPlayersCell", for: indexPath) as! PlayerViewCell
        
        return cell
    }

}
