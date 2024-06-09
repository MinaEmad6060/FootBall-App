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
        competitionsTable.delegate = self
        competitionsTable.dataSource = self
        let nibCustomCell = UINib(nibName: "CompetitionViewCell", bundle: nil)
        competitionsTable.register(nibCustomCell, forCellReuseIdentifier: "competitionCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = competitionsTable.indexPathForSelectedRow {
            competitionsTable.deselectRow(at: indexPath, animated: false)
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "competitionCell", for: indexPath) as! CompetitionViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailViewController = storyboard.instantiateViewController(withIdentifier: "competitionDetails") as! CompetitionDetailsViewController
            
            present(detailViewController, animated: true, completion: nil)
        }
    
    
}

