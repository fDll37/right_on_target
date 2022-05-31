//
//  ViewController.swift
//  Right on target
//
//  Created by Данил Менделев on 20.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    override func loadView() {
        super.loadView()
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Версия 1.2"
        self.view.addSubview(versionLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
// MARK: - Взаимодействие View - Model
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(slider.value))        // Проверяем, окончена ли игра
        if game.isGameEnded {
            showAlertWith(score: game.score)            // Начинаем игру заново
            game.restartGame()
        } else {
            game.startNewRound()
        }        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
//MARK: - Обновление View        // Обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
    }        // Отображение всплывающего окна со счетом
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

