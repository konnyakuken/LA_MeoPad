//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 若宮拓也 on 2022/08/24.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    //アクセス
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        //読み込み
        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self //デリゲートの所在を明示

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo(){
        //書き込み
        saveData.set(titleTextField.text, forKey:"title")
        saveData.set(contentTextView.text, forKey:"content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。",preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    //print("OKボタンが押されました")
                    self.navigationController?.popViewController(animated: true)
                }
            )
        )
        present(alert,animated: true,completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
