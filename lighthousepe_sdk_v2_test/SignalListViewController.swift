//
//  SignalListViewController.swift
//  lighthousepe_sdk_v2_test
//
//  Created by Erik Madsen on 6/5/19.
//  Copyright © 2019 Erik Madsen. All rights reserved.
//

import UIKit
import LighthouseKit

class SignalListViewController: UITableViewController {
    
    let reuseIdentifier = "SignalCell"
    var signals:[LHSignal] = [LHSignal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        Lighthouse.signalHistory {
            (signalsIn: [LHSignal]?, error: Error?) in
            
            for signal in signalsIn! {
                self.signals.append(signal)
            }
            
            self.tableView.reloadData()
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        let signal = signals[indexPath.row]
        
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text = signal.title
        cell?.detailTextLabel?.text = signal.alert
        
        if(signal.viewCount.intValue > 0){
            cell?.textLabel?.textColor = UIColor.gray
            cell?.detailTextLabel?.textColor = UIColor.gray
        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let signal = signals[indexPath.row]
        signal.viewCount = NSNumber(integerLiteral: signal.viewCount.intValue+1)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailView = storyBoard.instantiateViewController(withIdentifier: "signalDetailViewController") as! SignalDetailViewController
        
        detailView.signal = signal
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
