//
//  ViewController.swift
//  getRequest
//
//  Created by Stanley Chiang on 3/2/15.
//  Copyright (c) 2015 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func getRequestAction(sender: UIButton) {
        let url = NSURL(string: "http://www.stanleychiang.com/dbconnect/simpleGet.php?thing=3")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            
            println(NSString(data: data, encoding: NSUTF8StringEncoding)!)
        }


        task.resume()

    }

    @IBAction func postRequestAction(sender: UIButton) {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://www.stanleychiang.com/dbconnect/register.php")!)
        request.HTTPMethod = "POST"
        let postString = "email=Jack&password=Jack"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in

            if error != nil {
                println("error=\(error)")
                return
            }

            println("response = \(response)")

            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)!
            println("responseString = \(responseString)")
        }
        task.resume()

    }
}

