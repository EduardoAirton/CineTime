//
//  Description.swift
//  CineTime
//
//  Created by Beatriz Carlos on 17/06/20.
//  Copyright © 2020 Beatriz Carlos. All rights reserved.
//

import UIKit

class DescriptionView: UIView {
    lazy var titleLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        label.textAlignment = .left
        label.text = "Spider-Man: Into the Spider-Verse."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var categoriesLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.text = "Ação, aventura, animação."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageImdb : UIImageView = {
        let imagem = UIImageView()
        imagem.image = UIImage(named: "imdb")
        imagem.translatesAutoresizingMaskIntoConstraints = false
        return imagem
    }()
    
    lazy var imdbLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        label.textAlignment = .left
        label.text = "8.4"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionTextView : UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .none
        label.numberOfLines = 100
        label.font = UIFont.systemFont(ofSize: 22)
        label.text = "O adolescente Miles Morales se torna o Homem-Aranha de sua realidade, cruzando seu caminho com cinco colegas de outras dimensões para impedir uma ameaça para todas as realidades."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var captionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        label.textAlignment = .left
        label.text = "12 | 1h 57min | 10 de janeiro de 2019 (Brazil)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var disponibleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "Disponível em:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(categoriesLabel)
        addSubview(imageImdb)
        addSubview(imdbLabel)
        addSubview(descriptionTextView)
        addSubview(captionLabel)
        addSubview(disponibleLabel)
    }
    
    func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .black
        self.layer.cornerRadius = 20
    }
    
    func autoLayout() {
        // Title
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ])
        
        // Categories
        NSLayoutConstraint.activate([
            categoriesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            categoriesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            categoriesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5)
        ])
        
        // Image IMDB
        NSLayoutConstraint.activate([
            imageImdb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageImdb.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 5),
            imageImdb.heightAnchor.constraint(equalToConstant: 38.4),
            imageImdb.widthAnchor.constraint(equalToConstant: 38.4)
        ])
        
        // Label IMDB
        NSLayoutConstraint.activate([
            imdbLabel.leadingAnchor.constraint(equalTo: imageImdb.leadingAnchor, constant: 45),
            imdbLabel.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 16)
        ])
        
        // Description
        NSLayoutConstraint.activate([
            descriptionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            descriptionTextView.topAnchor.constraint(equalTo: imageImdb.bottomAnchor, constant: 10)
        ])
        
        // Caption label.
        NSLayoutConstraint.activate([
            captionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            captionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            captionLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20)
        ])
        
        // Disponible label.
        NSLayoutConstraint.activate([
            disponibleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            disponibleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            disponibleLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 10)
        ])
    }
}