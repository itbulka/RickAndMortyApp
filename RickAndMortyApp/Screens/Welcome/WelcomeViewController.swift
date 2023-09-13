//
//  WelcomeViewController.swift
//  RickAndMortyApp
//
//  Created by Владимир Повальский on 06.09.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let welcomeLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.Images.rickAndMortyLogo
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = R.Fonts.avenirMedium18
        label.textColor = .white
        label.textAlignment = .center
        label.text = R.Titles.welcomeDescription
        label.sizeToFit()
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        return label
    }()
    
    private let startButton: UIStartButton = UIStartButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        startAnimationWelcome()
    }
    
    override func viewWillLayoutSubviews() {
        setupConstraints()
    }

    private func configureView() {
        view.addSubview(welcomeLogoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(startButton)
        
        startButton.event = {
            /// - Link RootController
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLogoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLogoImageView.widthAnchor.constraint(equalToConstant: 300),
            welcomeLogoImageView.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLogoImageView.bottomAnchor, constant: -20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    private func startAnimationWelcome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            
            let newFrameLogo = CGRect(x: self.welcomeLogoImageView.frame.origin.x,
                                      y: self.welcomeLogoImageView.frame.origin.y - 60,
                                      width: self.welcomeLogoImageView.frame.size.width,
                                      height: self.welcomeLogoImageView.frame.size.height)
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
                self.welcomeLogoImageView.frame = newFrameLogo
            }, completion: { _ in
                let newFrameText = CGRect(x: self.descriptionLabel.frame.origin.x,
                                          y: self.descriptionLabel.frame.origin.y - 60,
                                          width: self.descriptionLabel.frame.size.width,
                                          height: self.descriptionLabel.frame.size.height)
                
                self.descriptionLabel.frame = newFrameText
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.descriptionLabel.alpha = 1.0
                    self.startButton.alpha = 1.0
                })
            })
        }
    }
    
}
