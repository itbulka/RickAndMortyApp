//
//  UIStartButton.swift
//  RickAndMortyApp
//
//  Created by Владимир Повальский on 13.09.2023.
//

import UIKit

class UIStartButton: UIButton {
    
    var event: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle(R.Titles.startButton, for: .normal)
        titleLabel?.font = R.Fonts.avenirMedium18
        tintColor = .white
        backgroundColor = .darkGray
        layer.cornerRadius = 14
        alpha = 0
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(eventStartButton), for: .touchUpInside)
    }
    
    @objc func eventStartButton() {
        
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            guard let self = self else { return }
            self.transform = .init(scaleX: 0.8, y: 0.8)
            self.event?()
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: { [weak self] in
                guard let self = self else { return }
                self.transform = .identity
            })
        })
        
    }

}
