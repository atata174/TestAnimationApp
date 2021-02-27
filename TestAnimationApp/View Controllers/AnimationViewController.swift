//
//  AnimationViewController.swift
//  TestAnimationApp
//
//  Created by PenguinRaja on 26.02.2021.
//

import Spring

class AnimationViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var effectTitle: UILabel!
    @IBOutlet var curveTitle: UILabel!
    @IBOutlet var delayTitle: UILabel!
    @IBOutlet var durationTitle: UILabel!
    @IBOutlet var forceTitle: UILabel!
    
    @IBOutlet var button: UIButton!
    @IBOutlet var firstViewForHidden: SpringView!
    @IBOutlet var viewForAnimate: SpringView!
    
    // MARK: - Properties
    
    private var animationModel: AnimationView!
    private var isPressed = false
    
    // MARK: - Actions
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if isPressed {
            currentRandomEffect()
            button.setTitle("Run \(animationModel.title.rawValue)", for: .normal)
        } else {
            isPressed = true
            firstViewForHidden.isHidden = true
            nextRandomEffect()
            currentRandomEffect()
            button.setTitle("Run \(animationModel.title.rawValue)", for: .normal)
        }
    }
    
    // MARK: - Functions for random
    
    private func nextRandomEffect(){
        animationModel = AnimationView(
            title: AnimationPreset.allCases.randomElement()!,
            curve: AnimationCurve.allCases.randomElement()!,
            force: Float.random(in: 0.5...2),
            duration: Float.random(in: 0.5...2),
            delay: Float.random(in: 0.5...2))
        
    }
    
    private func currentRandomEffect() {
        
        viewForAnimate.animation = animationModel.title.rawValue
        viewForAnimate.curve = animationModel.curve.rawValue
        viewForAnimate.delay = CGFloat(animationModel.delay)
        viewForAnimate.duration = CGFloat(animationModel.duration)
        viewForAnimate.force = CGFloat(animationModel.force)
        
        effectTitle.text = "preset: \(viewForAnimate.animation)"
        curveTitle.text = "curve: \(viewForAnimate.curve)"
        delayTitle.text = "delay: \(String(format: "%.2f", viewForAnimate.delay))"
        durationTitle.text = "duration: \(String(format: "%.2f", viewForAnimate.duration))"
        forceTitle.text = "force: \(String(format: "%.2f", viewForAnimate.force))"
        
        viewForAnimate.animate()
        nextRandomEffect()
        
    }
}
