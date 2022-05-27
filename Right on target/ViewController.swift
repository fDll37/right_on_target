//
//  ViewController.swift
//  Right on target
//
//  Created by Данил Менделев on 20.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    let text: Int = 0
    
    
    @IBAction func checkNumber() {    // если игра только начинается
        // получаем значение на слайдере
        let numSlider = Int(self.slider.value.rounded())        // сравниваем значение с загаданным        // и подсчитываем очки
        if numSlider > self.number {
            self.points += 50 - numSlider + self.number
        } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider
        } else {
            self.points += 50
        }
        if self.round == 5 {            // выводим информационное окно            // с результатами игры
            let alert = UIAlertController(
                title: "Игра окончена",
                message: "Вы заработали \(self.points) очков",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }        // генерируем случайное число
        self.number = Int.random(in: 1...50)  // передаем значение случайного числа в label
        self.label.text = String(self.number)
    }
    
    
    override func loadView() {
        super.loadView()
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))    // изменяем текст метки
        versionLabel.text = "Версия 1.1"    // добавляем метку в родительский view
        self.view.addSubview(versionLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)        // устанавливаем счетчик раундов на 1
    }
    
    
}

