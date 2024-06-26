//
//  ViewController.swift
//  Picker View
//
//  Created by H . on 20/04/1444 AH.
//

import UIKit
// linking the data source and delegate as rotocolse in this class


class ViewController: UIViewController {
    
// vars
    var gameState : Int = Int()
    var pickerRange = [String]()
    var SelectedRange =  Int()
    var choosedNum : Int = Int()
    var guessedNum : Int = Int()
    var gameResult = String()

    
// outlets
    @IBOutlet weak var displayAction: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var enterbtn: UIButton!
    @IBAction func enterBtn(_ sender: UIButton) {
    
        switch gameState{
        case 0 :
            pickerView.isUserInteractionEnabled = true
            pickerRange.removeAll()
            
            for i in 1..<SelectedRange + 1{
                pickerRange.append(String(i))
            }
            pickerView.reloadAllComponents()
            pickerView.selectRow(0, inComponent: 0, animated: true)
            displayAction.text = "Player 1 \n\n Enter a number for Player 2 to guess , from 1 to \(SelectedRange)"
            enterbtn.setTitle("Enter Number", for: .normal)
            gameState += 1
            enterbtn.isEnabled = false
        case 1 :
            pickerView.selectRow(0, inComponent: 0, animated: true)
            displayAction.text = "Player 2 \n take a guess of range 1 to \(SelectedRange)"
            enterbtn.setTitle("Enter guess", for: .normal)
            gameState += 1
            enterbtn.isEnabled = false
        case 2 :
            pickerView.isUserInteractionEnabled = false
            displayAction.text = gameResult
            enterbtn.setTitle("play Again", for: .normal)
            gameState += 1
            SelectedRange = 101
        case 3:
            restart()
        default:
            break
        }

    }
    
    func restart(){
        pickerView.isUserInteractionEnabled = true
        pickerView.selectRow(0, inComponent: 0, animated: true)
        displayAction.text = "Please select a range for guessing game"
        enterbtn.setTitle("Enter Range", for: .normal)
        enterbtn.isEnabled = false
        
        pickerRange.removeAll()
        
        for i in 1..<101{
            pickerRange.append(String(i))
        }
        gameState = 0
        pickerView.reloadAllComponents()
    }
    

 
 
        
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        restart()
    }
}
    


extension ViewController : UIPickerViewDelegate{
    
}

extension ViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
  
        pickerRange.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerRange[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        enterbtn.isEnabled = true
        switch gameState {
        case 0 : SelectedRange = row + 1
        case 1 : choosedNum = row + 1
        case 2 : guessedNum = row + 1
            if choosedNum == guessedNum {
                gameResult = "Correct! \n\nThe choosed number was \(choosedNum) and you guessed \(guessedNum) "
            } else {
                gameResult = " Incorrect \n The choosed number was \(choosedNum) and you guessed \(guessedNum)"
            }
            
        default:
            break
        }
    }

}


/*
 
  
 // First Try Code
 
 // vars
     var numbers = [Int] ()
     var SelectedNumbers = [Int] ()
     var enterd : Int = Int()
     
     
 // outlets
     @IBOutlet weak var playerTurn: UILabel!
     @IBOutlet weak var displayAction: UILabel!
     @IBOutlet weak var pickerView: UIPickerView!
     @IBAction func enterBtn(_ sender: Any) {
         enterd = numbers[pickerView.selectedRow(inComponent: 0)]
         let selectedRange = 1...enterd
         displayAction.text = "Your range for guessing is : \(selectedRange)"
         

     }
     

  
  
         
     override func viewDidLoad() {
         super.viewDidLoad()
         pickerView.delegate = self
         pickerView.dataSource = self
         
         for i in 1..<101 {
             numbers.append(Int(i))
                }

         for i in 1..<enterd + 1 {
             SelectedNumbers.append(Int(i))
                }
         pickerView.reloadAllComponents()

     }
     
     func updatepickerView(){
         numbers.removeAll()
         for i in 1..<enterd + 1 {
             numbers.append(Int(i))
                }
         print(numbers)
     }
     
 }

 extension ViewController : UIPickerViewDelegate{
     
 }

 extension ViewController : UIPickerViewDataSource{
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     switch component {
             case 0 : return numbers.count
                 case 1:
                     let selected = pickerView.selectedRow(inComponent: 0)
                     let selectedName = numbers[selected]
                     return selectedName[selectedName]?.count ?? 0
                 default: return 0
                 }
 //        numbers.count
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return String(numbers[row])
     }
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         
         pickerView.numberOfRows(inComponent: SelectedNumbers.count)

     }
     
 
 */
