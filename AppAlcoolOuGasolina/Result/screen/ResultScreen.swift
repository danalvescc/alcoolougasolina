//
//  ResultScreen.swift
//  AppAlcoolOuGasolina
//
//  Created by Daniel  Alves Barreto on 30/01/23.
//

import UIKit

protocol ResultScreenProtocol: AnyObject {
    func tappedCalcAgainButton()
    func tappedBackButton()
}

class ResultScreen: UIView {
    
    private weak var delegate: ResultScreenProtocol?
    public func delegate(delegate: ResultScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Abasteça com:"
        label.font = UIFont.boldSystemFont(ofSize: 31)
        label.textColor = .white
        return label
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 73)
        label.textColor = .white
        label.text = "Gasolina"
        return label
    }()
    
    lazy var calcAgainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular novamente", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalcAgainButton), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ResultScreen{
    private func setup() {
        setupBackgroundImage()
        setupLogoImage()
        setupCalcAgainButton()
        setupSentenceLabel()
        setupResultLabel()
        setupBackButton()
    }
    
    private func setupBackgroundImage(){
        addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setupLogoImage(){
        addSubview(logoImage)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupCalcAgainButton(){
        addSubview(calcAgainButton)
        
        NSLayoutConstraint.activate([
            calcAgainButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -135),
            calcAgainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calcAgainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calcAgainButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupSentenceLabel(){
        addSubview(sentenceLabel)
        NSLayoutConstraint.activate([
            sentenceLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 122),
            sentenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupResultLabel(){
        addSubview(resultLabel)
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: sentenceLabel.bottomAnchor, constant: 12),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupBackButton(){
        addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
}


// MARK: Actions
extension ResultScreen {
    @objc func tappedCalcAgainButton(){
        delegate?.tappedCalcAgainButton()
    }
    
    @objc func tappedBackButton(){
        delegate?.tappedBackButton()
    }
}
