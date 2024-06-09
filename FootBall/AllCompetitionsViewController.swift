//
//  ViewController.swift
//  FootBall
//
//  Created by Mina Emad on 09/06/2024.
//

import UIKit

class AllCompetitionsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var competitionsTable: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        competitionsTable.delegate = self
        competitionsTable.dataSource = self
        let nibCustomCell = UINib(nibName: "CompetitionViewCell", bundle: nil)
        competitionsTable.register(nibCustomCell, forCellReuseIdentifier: "competitionCell")
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "competitionCell", for: indexPath) as! CompetitionViewCell

        return cell
    }
    
    
}

