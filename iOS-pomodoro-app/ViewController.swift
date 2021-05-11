//
//  ViewController.swift
//  iOS-pomodoro-app
//
//  Created by Maria Pavlovic on 2021-04-27.
//

import UIKit

var studyMinutesString: String = ""
var studyMinutes: Int = 0
var breakMinutesString: String = ""
var breakMinutes: Int = 0
var numRounds: Int = 0

class HomePageViewController: UIViewController {
	let appTitleLabel = UILabel()
	let oneRoundButton = UIButton()
	let twoRoundButton = UIButton()
	let threeRoundButton = UIButton()
	let fourRoundButton = UIButton()
	let chooseRoundsLabel = UILabel()
	let studyButton25 = UIButton()
	let studyButton30 = UIButton()
	let studyButton45 = UIButton()
	let studyButton60 = UIButton()
	let chooseStudyMinsLabel = UILabel()
	let breakButton5 = UIButton()
	let breakButton10 = UIButton()
	let breakButton15 = UIButton()
	let breakButton20 = UIButton()
	let chooseBreakMinsLabel = UILabel()
	let goToTimerPage = UIButton()
		
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.isNavigationBarHidden = true
		
		let viewHeight = view.frame.height
		let viewWidth = view.frame.width

		view.backgroundColor = .white
		
		if studyMinutes == 0 {
			studyMinutesString = "25:00"
			studyMinutes = 25
			breakMinutesString = "5:00"
			breakMinutes = 5
			numRounds = 1
		}

		appTitleLabel.text = "Pomodoro Timer"
		appTitleLabel.textAlignment = .center
		appTitleLabel.font = appTitleLabel.font.withSize(40)
		appTitleLabel.frame = CGRect(x: (viewWidth-300)/2, y: viewHeight*0.1, width: 300, height: 60)

		chooseRoundsLabel.text = "# of rounds:"
		chooseRoundsLabel.textAlignment = .center
		chooseRoundsLabel.font = chooseRoundsLabel.font.withSize(30)
		chooseRoundsLabel.frame = CGRect(x: (viewWidth-300)/2, y: viewHeight*0.2, width: 300, height: 60)
		
		chooseStudyMinsLabel.text = "study period minutes:"
		chooseStudyMinsLabel.textAlignment = .center
		chooseStudyMinsLabel.font = chooseStudyMinsLabel.font.withSize(30)
		chooseStudyMinsLabel.frame = CGRect(x: (viewWidth-300)/2, y: viewHeight*0.45, width: 300, height: 60)

		chooseBreakMinsLabel.text = "break period minutes:"
		chooseBreakMinsLabel.textAlignment = .center
		chooseBreakMinsLabel.font = chooseBreakMinsLabel.font.withSize(30)
		chooseBreakMinsLabel.frame = CGRect(x: (viewWidth-300)/2, y: viewHeight*0.7, width: 300, height: 60)
		
		goToTimerPage.setTitle("next", for: .normal)
		goToTimerPage.setTitleColor(.black, for: .normal)
		goToTimerPage.frame = CGRect(x: (viewWidth-100)/2, y: viewHeight*0.9, width: 100, height: 60)
		goToTimerPage.addTarget(self, action: #selector(goToTimerPageTap), for: .touchUpInside)
		goToTimerPage.titleLabel?.textAlignment = .center
		goToTimerPage.titleLabel?.font = .systemFont(ofSize: 30)

		studyButton25.setTitle("25", for: .normal)
		studyButton25.setTitleColor(studyMinsPicked(mins: 25), for: .normal)
		studyButton25.addTarget(self, action: #selector(studyMins25Tap), for: .touchUpInside)
		studyButton25.titleLabel?.textAlignment = .center
		studyButton25.titleLabel?.font = .systemFont(ofSize: 22)

		studyButton30.setTitle("30", for: .normal)
		studyButton30.setTitleColor(studyMinsPicked(mins: 30), for: .normal)
		studyButton30.addTarget(self, action: #selector(studyMins30Tap), for: .touchUpInside)
		studyButton30.titleLabel?.textAlignment = .center
		studyButton30.titleLabel?.font = .systemFont(ofSize: 22)

		studyButton45.setTitle("45", for: .normal)
		studyButton45.setTitleColor(studyMinsPicked(mins: 45), for: .normal)
		studyButton45.addTarget(self, action: #selector(studyMins45Tap), for: .touchUpInside)
		studyButton45.titleLabel?.textAlignment = .center
		studyButton45.titleLabel?.font = .systemFont(ofSize: 22)

		studyButton60.setTitle("60", for: .normal)
		studyButton60.setTitleColor(studyMinsPicked(mins: 60), for: .normal)
		studyButton60.addTarget(self, action: #selector(studyMins60Tap), for: .touchUpInside)
		studyButton60.titleLabel?.textAlignment = .center
		studyButton60.titleLabel?.font = .systemFont(ofSize: 22)

		breakButton5.setTitle("5", for: .normal)
		breakButton5.setTitleColor(breakMinsPicked(mins: 5), for: .normal)
		breakButton5.addTarget(self, action: #selector(breakMins5Tap), for: .touchUpInside)
		breakButton5.titleLabel?.textAlignment = .center
		breakButton5.titleLabel?.font = .systemFont(ofSize: 22)

		breakButton10.setTitle("10", for: .normal)
		breakButton10.setTitleColor(breakMinsPicked(mins: 10), for: .normal)
		breakButton10.addTarget(self, action: #selector(breakMins10Tap), for: .touchUpInside)
		breakButton10.titleLabel?.textAlignment = .center
		breakButton10.titleLabel?.font = .systemFont(ofSize: 22)

		breakButton15.setTitle("15", for: .normal)
		breakButton15.setTitleColor(breakMinsPicked(mins: 15), for: .normal)
		breakButton15.addTarget(self, action: #selector(breakMins15Tap), for: .touchUpInside)
		breakButton15.titleLabel?.textAlignment = .center
		breakButton15.titleLabel?.font = .systemFont(ofSize: 22)

		breakButton20.setTitle("20", for: .normal)
		breakButton20.setTitleColor(breakMinsPicked(mins: 20), for: .normal)
		breakButton20.addTarget(self, action: #selector(breakMins20Tap), for: .touchUpInside)
		breakButton20.titleLabel?.textAlignment = .center
		breakButton20.titleLabel?.font = .systemFont(ofSize: 22)
		
		oneRoundButton.setTitle("1", for: .normal)
		oneRoundButton.setTitleColor(numRoundPicked(rounds: 1), for: .normal)
		oneRoundButton.addTarget(self, action: #selector(oneRoundTap), for: .touchUpInside)
		oneRoundButton.titleLabel?.textAlignment = .center
		oneRoundButton.titleLabel?.font = .systemFont(ofSize: 22)

		twoRoundButton.setTitle("2", for: .normal)
		twoRoundButton.setTitleColor(numRoundPicked(rounds: 2), for: .normal)
		twoRoundButton.addTarget(self, action: #selector(twoRoundTap), for: .touchUpInside)
		twoRoundButton.titleLabel?.textAlignment = .center
		twoRoundButton.titleLabel?.font = .systemFont(ofSize: 22)

		threeRoundButton.setTitle("3", for: .normal)
		threeRoundButton.setTitleColor(numRoundPicked(rounds: 3), for: .normal)
		threeRoundButton.addTarget(self, action: #selector(threeRoundTap), for: .touchUpInside)
		threeRoundButton.titleLabel?.textAlignment = .center
		threeRoundButton.titleLabel?.font = .systemFont(ofSize: 22)

		fourRoundButton.setTitle("4", for: .normal)
		fourRoundButton.setTitleColor(numRoundPicked(rounds: 4), for: .normal)
		fourRoundButton.addTarget(self, action: #selector(fourRoundTap), for: .touchUpInside)
		fourRoundButton.titleLabel?.textAlignment = .center
		fourRoundButton.titleLabel?.font = .systemFont(ofSize: 22)

		view.addSubview(chooseRoundsLabel)
		view.addSubview(chooseStudyMinsLabel)
		view.addSubview(chooseBreakMinsLabel)
		view.addSubview(goToTimerPage)
		view.addSubview(appTitleLabel)

		let roundsStackView = UIStackView()
		roundsStackView.axis = .horizontal
		roundsStackView.spacing = 10
		roundsStackView.translatesAutoresizingMaskIntoConstraints = false
		roundsStackView.addArrangedSubview(oneRoundButton)
		oneRoundButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
		oneRoundButton.heightAnchor.constraint(equalToConstant: 75).isActive = true

		roundsStackView.addArrangedSubview(twoRoundButton)
		twoRoundButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
		twoRoundButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
		
		roundsStackView.addArrangedSubview(threeRoundButton)
		threeRoundButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
		threeRoundButton.heightAnchor.constraint(equalToConstant: 75).isActive = true

		roundsStackView.addArrangedSubview(fourRoundButton)
		fourRoundButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
		fourRoundButton.heightAnchor.constraint(equalToConstant: 75).isActive = true

		view.addSubview(roundsStackView)
		roundsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		roundsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: viewHeight*0.25).isActive = true

		let studyMinsStackView = UIStackView()
		studyMinsStackView.axis = .horizontal
		studyMinsStackView.spacing = 10
		studyMinsStackView.translatesAutoresizingMaskIntoConstraints = false
		studyMinsStackView.addArrangedSubview(studyButton25)
		studyButton25.widthAnchor.constraint(equalToConstant: 75).isActive = true
		studyButton25.heightAnchor.constraint(equalToConstant: 75).isActive = true

		studyMinsStackView.addArrangedSubview(studyButton30)
		studyButton30.widthAnchor.constraint(equalToConstant: 75).isActive = true
		studyButton30.heightAnchor.constraint(equalToConstant: 75).isActive = true
		
		studyMinsStackView.addArrangedSubview(studyButton45)
		studyButton45.widthAnchor.constraint(equalToConstant: 75).isActive = true
		studyButton45.heightAnchor.constraint(equalToConstant: 75).isActive = true

		studyMinsStackView.addArrangedSubview(studyButton60)
		studyButton60.widthAnchor.constraint(equalToConstant: 75).isActive = true
		studyButton60.heightAnchor.constraint(equalToConstant: 75).isActive = true

		view.addSubview(studyMinsStackView)
		studyMinsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		studyMinsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: viewHeight*0.5).isActive = true

		
		let breakMinsStackView = UIStackView()
		breakMinsStackView.axis = .horizontal
		breakMinsStackView.spacing = 10
		breakMinsStackView.translatesAutoresizingMaskIntoConstraints = false
		breakMinsStackView.addArrangedSubview(breakButton5)
		breakButton5.widthAnchor.constraint(equalToConstant: 75).isActive = true
		breakButton5.heightAnchor.constraint(equalToConstant: 75).isActive = true

		breakMinsStackView.addArrangedSubview(breakButton10)
		breakButton10.widthAnchor.constraint(equalToConstant: 75).isActive = true
		breakButton10.heightAnchor.constraint(equalToConstant: 75).isActive = true
		
		breakMinsStackView.addArrangedSubview(breakButton15)
		breakButton15.widthAnchor.constraint(equalToConstant: 75).isActive = true
		breakButton15.heightAnchor.constraint(equalToConstant: 75).isActive = true

		breakMinsStackView.addArrangedSubview(breakButton20)
		breakButton20.widthAnchor.constraint(equalToConstant: 75).isActive = true
		breakButton20.heightAnchor.constraint(equalToConstant: 75).isActive = true

		view.addSubview(breakMinsStackView)
		breakMinsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		breakMinsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: viewHeight*0.75).isActive = true
	}
	
	@objc private func numRoundPicked(rounds: Int) -> UIColor {
		if rounds == numRounds {
			return .orange
		}
		else {
			return .black
		}
	}
	
	@objc private func studyMinsPicked(mins: Int) -> UIColor {
		if mins == studyMinutes {
			return .orange
		}
		else {
			return .black
		}
	}
	
	@objc private func breakMinsPicked(mins: Int) -> UIColor {
		if mins == breakMinutes {
			return .orange
		}
		else {
			return .black
		}
	}
	
	@objc private func oneRoundTap(sender: UIButton!) {
		oneRoundButton.setTitleColor(.orange, for: .normal)
		twoRoundButton.setTitleColor(.black, for: .normal)
		threeRoundButton.setTitleColor(.black, for: .normal)
		fourRoundButton.setTitleColor(.black, for: .normal)
		numRounds = 1
	}

	@objc private func twoRoundTap(sender: UIButton!) {
		oneRoundButton.setTitleColor(.black, for: .normal)
		twoRoundButton.setTitleColor(.orange, for: .normal)
		threeRoundButton.setTitleColor(.black, for: .normal)
		fourRoundButton.setTitleColor(.black, for: .normal)
		numRounds = 2
	}

	@objc private func threeRoundTap(sender: UIButton!) {
		oneRoundButton.setTitleColor(.black, for: .normal)
		twoRoundButton.setTitleColor(.black, for: .normal)
		threeRoundButton.setTitleColor(.orange, for: .normal)
		fourRoundButton.setTitleColor(.black, for: .normal)
		numRounds = 3
	}

	@objc private func fourRoundTap(sender: UIButton!) {
		oneRoundButton.setTitleColor(.black, for: .normal)
		twoRoundButton.setTitleColor(.black, for: .normal)
		threeRoundButton.setTitleColor(.black, for: .normal)
		fourRoundButton.setTitleColor(.orange, for: .normal)
		numRounds = 4
	}
	
	@objc private func studyMins25Tap(sender: UIButton!) {
		studyButton25.setTitleColor(.orange, for: .normal)
		studyButton30.setTitleColor(.black, for: .normal)
		studyButton45.setTitleColor(.black, for: .normal)
		studyButton60.setTitleColor(.black, for: .normal)
		studyMinutesString = "25:00"
		studyMinutes = 25
	}
	
	@objc private func studyMins30Tap(sender: UIButton!) {
		studyButton25.setTitleColor(.black, for: .normal)
		studyButton30.setTitleColor(.orange, for: .normal)
		studyButton45.setTitleColor(.black, for: .normal)
		studyButton60.setTitleColor(.black, for: .normal)
		studyMinutesString = "30:00"
		studyMinutes = 30
	}
	
	@objc private func studyMins45Tap(sender: UIButton!) {
		studyButton25.setTitleColor(.black, for: .normal)
		studyButton30.setTitleColor(.black, for: .normal)
		studyButton45.setTitleColor(.orange, for: .normal)
		studyButton60.setTitleColor(.black, for: .normal)
		studyMinutesString = "45:00"
		studyMinutes = 45
	}
	
	@objc private func studyMins60Tap(sender: UIButton!) {
		studyButton25.setTitleColor(.black, for: .normal)
		studyButton30.setTitleColor(.black, for: .normal)
		studyButton45.setTitleColor(.black, for: .normal)
		studyButton60.setTitleColor(.orange, for: .normal)
		studyMinutesString = "60:00"
		studyMinutes = 60
	}

	@objc private func breakMins5Tap(sender: UIButton!) {
		breakButton5.setTitleColor(.orange, for: .normal)
		breakButton10.setTitleColor(.black, for: .normal)
		breakButton15.setTitleColor(.black, for: .normal)
		breakButton20.setTitleColor(.black, for: .normal)
		breakMinutesString = "05:00"
		breakMinutes = 5
	}
	
	@objc private func breakMins10Tap(sender: UIButton!) {
		breakButton5.setTitleColor(.black, for: .normal)
		breakButton10.setTitleColor(.orange, for: .normal)
		breakButton15.setTitleColor(.black, for: .normal)
		breakButton20.setTitleColor(.black, for: .normal)
		breakMinutesString = "10:00"
		breakMinutes = 10
	}
	
	@objc private func breakMins15Tap(sender: UIButton!) {
		breakButton5.setTitleColor(.black, for: .normal)
		breakButton10.setTitleColor(.black, for: .normal)
		breakButton15.setTitleColor(.orange, for: .normal)
		breakButton20.setTitleColor(.black, for: .normal)
		breakMinutesString = "15:00"
		breakMinutes = 15
	}
	
	@objc private func breakMins20Tap(sender: UIButton!) {
		breakButton5.setTitleColor(.black, for: .normal)
		breakButton10.setTitleColor(.black, for: .normal)
		breakButton15.setTitleColor(.black, for: .normal)
		breakButton20.setTitleColor(.orange, for: .normal)
		breakMinutesString = "20:00"
		breakMinutes = 20
	}
	
	@objc private func goToTimerPageTap(sender: UIButton!) {
		goToTimerPage.setTitleColor(.orange, for: .normal)
		let timerPageVC = TimerPageViewController()
		let timerPageView = UINavigationController(rootViewController: timerPageVC)
		timerPageView.modalPresentationStyle = .fullScreen
		present(timerPageView, animated: true)
	}
}


class TimerPageViewController: UIViewController {
	let startButton = UIButton()
	let stopButton = UIButton()
	let resetButton = UIButton()
	let timeLabel = UILabel()
	let appTitleLabel = UILabel()
	let goBackToHomePage = UIButton()

	var timer = Timer()
	var timerRunning = false
	var counter = 0
	var studyPeriod = true
	var breakPeriod = false
	var round = 0

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.isNavigationBarHidden = true
		let viewHeight = view.frame.height
		let viewWidth = view.frame.width
		view.backgroundColor = .white
		appTitleLabel.text = "Pomodoro Timer"
		appTitleLabel.textAlignment = .center
		appTitleLabel.font = appTitleLabel.font.withSize(40)
		appTitleLabel.frame = CGRect(x: (viewWidth-300)/2, y: viewHeight*0.1, width: 300, height: 60)
		
		startButton.setTitle("START", for: .normal)
		startButton.setTitleColor(.black, for: .normal)
		startButton.setTitleColor(.gray, for: .disabled)
		startButton.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)
		startButton.titleLabel?.textAlignment = .center
		startButton.titleLabel?.font = .systemFont(ofSize: 22)

		stopButton.setTitle("STOP", for: .normal)
		stopButton.setTitleColor(.black, for: .normal)
		stopButton.setTitleColor(.gray, for: .disabled)
		stopButton.addTarget(self, action: #selector(stopButtonTap), for: .touchUpInside)
		stopButton.titleLabel?.textAlignment = .center
		stopButton.titleLabel?.font = .systemFont(ofSize: 22)

		resetButton.setTitle("RESET", for: .normal)
		resetButton.setTitleColor(.black, for: .normal)
		resetButton.setTitleColor(.gray, for: .disabled)
		resetButton.frame = CGRect(x: (viewWidth-100)/2, y: viewHeight*0.55, width: 100, height: 60)
		resetButton.addTarget(self, action: #selector(resetButtonTap), for: .touchUpInside)
		resetButton.titleLabel?.textAlignment = .center
		resetButton.titleLabel?.font = .systemFont(ofSize: 22)

		goBackToHomePage.setTitle("back", for: .normal)
		goBackToHomePage.setTitleColor(.black, for: .normal)
		goBackToHomePage.setTitleColor(.gray, for: .disabled)
		goBackToHomePage.frame = CGRect(x: (viewWidth-100)/2, y: viewHeight*0.9, width: 100, height: 60)
		goBackToHomePage.addTarget(self, action: #selector(goBackToHomePageTap), for: .touchUpInside)
		goBackToHomePage.titleLabel?.textAlignment = .center
		goBackToHomePage.titleLabel?.font = .systemFont(ofSize: 30)

		timeLabel.text = studyMinutesString
		timeLabel.font = timeLabel.font.withSize(36)
		timeLabel.textAlignment = .center
		timeLabel.frame = CGRect(x: (viewWidth-200)/2, y: viewHeight*0.35, width: 200, height: 60)

		startButton.isEnabled = true
		stopButton.isEnabled = false
		resetButton.isEnabled = false
		
		view.addSubview(appTitleLabel)
		view.addSubview(startButton)
		view.addSubview(stopButton)
		view.addSubview(resetButton)
		view.addSubview(goBackToHomePage)
		view.addSubview(timeLabel)

		let timerStackView = UIStackView()
		timerStackView.axis = .horizontal
		timerStackView.translatesAutoresizingMaskIntoConstraints = false
		timerStackView.addArrangedSubview(startButton)
		startButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
		startButton.heightAnchor.constraint(equalToConstant: 150).isActive = true

		timerStackView.addArrangedSubview(stopButton)
		stopButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
		stopButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
		
		view.addSubview(timerStackView)
		timerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		timerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
	
	@objc func startButtonTap(sender: UIButton!) {
		if !timerRunning {
			timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
			timerRunning = true
			startButton.isEnabled = false
			resetButton.isEnabled = true
			stopButton.isEnabled = true
			timeLabel.isEnabled = true
		}
	}
	
	@objc func runTimer() {
		counter += 1
		var minuteString = ""
		let seconds = 60 - ((counter % 3600) % 60)
		var secondString = ""
		
		if seconds < 10 {
			secondString = "0\(seconds)"
		}
		else {
			secondString = "\(seconds)"
		}
		
		if studyPeriod {
			let minutes = (studyMinutes-1) - ((counter % 3600) / 60)
			
			if minutes < 10 {
				minuteString = "0\(minutes)"
			} else {
				minuteString = "\(minutes)"
			}
			
			// study period finished
			if minutes == -1 && seconds == 60 {
				counter = 0
				studyPeriod = false
				breakPeriod = true
			}
			
			// fixes an issue when seconds reaches 60
			// shows (ex.) 24:00 instead of 23:60
			if seconds == 60 {
				secondString = "00"
				if minutes < 10 {
					minuteString = "0\(minutes + 1)"
				}
				else {
					minuteString = "\(minutes + 1)"
				}
			}
		}
		
		else {
			let minutes = (breakMinutes-1) - ((counter % 3600) / 60)
			
			if minutes < 10 {
				minuteString = "0\(minutes)"
			} else {
				minuteString = "\(minutes)"
			}
			
			// break period finished
			if minutes == -1 && seconds == 60 {
				round += 1
				if round < numRounds {
					studyPeriod = true
					breakPeriod = false
					counter = 0
				}
				else {
					studyPeriod = true
					breakPeriod = false
					timerRunning = false
					timer.invalidate()
					round = 0
					startButton.isEnabled = false
					stopButton.isEnabled = false
					resetButton.isEnabled = true
				}
			}

			// fixes an issue when seconds reaches 60
			// shows (ex.) 24:00 instead of 23:60
			if seconds == 60 {
				secondString = "00"
				if minutes < 10 {
					minuteString = "0\(minutes + 1)"
				}
				else {
					minuteString = "\(minutes + 1)"
				}
			}
			
		}
		timeLabel.text = "\(minuteString):\(secondString)"
	}

	@objc func stopButtonTap(sender: UIButton!) {
		timerRunning = false
		startButton.isEnabled = true
		stopButton.isEnabled = false
		resetButton.isEnabled = true
		timer.invalidate()
	}

	@objc func resetButtonTap(sender: UIButton!) {
		timerRunning = false
		startButton.isEnabled = true
		stopButton.isEnabled = false
		resetButton.isEnabled = false
		timer.invalidate()
		counter = 0
		if studyPeriod {
			timeLabel.text = studyMinutesString
		} else {
			timeLabel.text = breakMinutesString
		}
	}
	
	@objc func goBackToHomePageTap(sender: UIButton!) {
		timerRunning = false
		timer.invalidate()
		goBackToHomePage.setTitleColor(.orange, for: .normal)
		let homePageVC = HomePageViewController()
		let homePageView = UINavigationController(rootViewController: homePageVC)
		homePageView.modalPresentationStyle = .fullScreen
		present(homePageView, animated: true)
	}
}
