//
//  InternetDetailViewController.swift
//  InternetApp
//
//  Created by Judkins, Jensen on 12/14/18.
//  Copyright © 2018 Judkins, Jensen. All rights reserved.
//

import UIKit
import WebKit

class InternetDetailViewController: UIViewController
{

    @IBOutlet weak var webViewer: WKWebView!
    @IBOutlet weak var screenTitle: UILabel!
    var detailTitle : String?
    {
        didSet
        {
            updateView()
        }
    }
    
    var detailAddress : String?
    {
        didSet
        {
            updateView()
        }
    }
    
    private func updateView() -> Void
    {
        if(detailTitle != nil && screenTitle != nil && webViewer != nil)
        {
            if(detailTitle?.range(of: "Definitions", options: .caseInsensitive) != nil)
            {
                
                loadPDF()
            }
            else
            {
                if(detailAddress != nil)
                {
                    loadURL(webAddress: detailAddress!)
                }
            }
        screenTitle?.text = detailTitle
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    
    private func loadURL(webAddress: String) -> Void
    {
        let currentURL = URL(string: webAddress)
        let currentWebRequest = URLRequest(url: currentURL!)
        webViewer.load(currentWebRequest)
    }
    
    private func loadPDF() -> Void
    {
        if let contentPDF = Bundle.main.url(forResource: "Your PDF Name HERE", withExtension: "pdf", subdirectory: nil, localization: nil)
        {
            let requestedPDF = NSURLRequest(url: contentPDF)
            webViewer.load(requestedPDF as URLRequest)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
