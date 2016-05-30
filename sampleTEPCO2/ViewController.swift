//
//  ViewController.swift
//  sampleTEPCO2
//
//  Created by RIho OKubo on 2016/05/05.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //選択肢を日付のみにセット
        
        myDatePicker.datePickerMode = UIDatePickerMode.Date
        
//        //初期の日付を設定（デフォルトだと今日になってる）
//        let df = NSDateFormatter()
//        
//        //日付のフォーマットを指定
//        df.dateFormat = "yyyy/MM/dd"
//        
//        //local を右側でjapaneseに変更
        
        //今日まで
        myDatePicker.maximumDate = NSDate()
        
        
        
    }

    @IBAction func tapBtn(sender: UIButton) {
        
        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        var dateStr = df.stringFromDate(myDatePicker.date)
        
        var url = NSURL(string: "http://tepco-usage-api.appspot.com/\(dateStr)/0.json")
        var request = NSURLRequest(URL:url!)
        var jsondata = (try! NSURLConnection.sendSynchronousRequest(request, returningResponse: nil))
        let jsonDictionary = (try! NSJSONSerialization.JSONObjectWithData(jsondata, options: [])) as! NSDictionary
        for(key, data) in jsonDictionary{
            print("\(key)=\(data)")
        
        }
        
        
    }

        



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

