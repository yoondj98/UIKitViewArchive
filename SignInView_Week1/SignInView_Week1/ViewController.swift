//
//  ViewController.swift
//  SignInView_Week1
//
//  Created by 윤동주 on 6/14/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties

    var closeButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = UIColor(hexCode: "49B8FD")
        
        return button
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Sign In"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        
        return label
    }()
    
    var subTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Get your progress and streaks back!"
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    var emailField: UITextField = {
        let field = UITextField()
        
        field.layer.borderColor = UIColor(hexCode: "D4D4D4").cgColor
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 5
        field.leftViewMode = .always
        
        field.placeholder = "Email"
                
        return field
    }()
    
    var passwordField: UITextField = {
        let field = UITextField()
        
        field.layer.borderColor = UIColor(hexCode: "D4D4D4").cgColor
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 5
        field.leftViewMode = .always
        field.isSecureTextEntry = true // secure 처리
        
        field.placeholder = "Password"
        
        return field
    }()
    
    
    // Configuration과 UIAction을 적용해봄.
    var loginButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(hexCode: "49BBFD")
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        configuration.attributedTitle = AttributedString("Login", attributes: titleContainer)
        configuration.showsActivityIndicator = false
        configuration.imagePadding = 10
        
        // Click 시 버튼이 비활성화되면서 ActivityIndicator 등장
        var loginAction = UIAction { action in
            guard let button = action.sender as? UIButton else { return }
            button.isEnabled = false // 적용 시 회색 처리가 됨.
            button.configuration?.showsActivityIndicator = true
        }
        let button = UIButton(configuration: configuration, primaryAction: loginAction)
       
        return button
    }()

    var signUpTextStackView: UIStackView = {
        let view = UIStackView()
        
        view.spacing = 5
        view.alignment = .center
        view.axis = .horizontal
        
        return view
    }()

    var signUpLabel: UILabel = {
        let signUpLabel = UILabel()
        
        signUpLabel.text = "or"
        signUpLabel.textColor = UIColor(hexCode: "A3A3A3")
        
        return signUpLabel
    }()
    
    var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor(hexCode: "49BBFD"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return button
    }()

    var findingPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Forgot Password", for: .normal)
        button.setTitleColor(UIColor(hexCode: "49BBFD"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(emailField)
        
        let emailLeftView = UIView()
        emailField.leftView = emailLeftView
        
        let passwordLeftView = UIView()
        passwordField.leftView = passwordLeftView
        view.addSubview(passwordField)
        
        view.addSubview(loginButton)
        [signUpLabel, signUpButton].forEach { signUpTextStackView.addArrangedSubview($0) }
        view.addSubview(signUpTextStackView)
        view.addSubview(findingPasswordButton)
    }
    
    func setupConstraints() {
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(3)
            $0.centerX.equalTo(view)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.centerX.equalTo(view)
        }
        
        emailField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(98)
            $0.leading.trailing.equalToSuperview().inset(69)
            $0.height.equalTo(42)
            $0.centerX.equalTo(view)
        }
        
        emailField.leftView?.snp.makeConstraints {
            $0.height.equalTo(42)
            $0.width.equalTo(18)
        }
        
        passwordField.snp.makeConstraints {
            $0.top.equalTo(emailField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(69)
            $0.height.equalTo(42)
            
            $0.centerX.equalTo(view)
        }
        
        passwordField.leftView?.snp.makeConstraints {
            $0.height.equalTo(42)
            $0.width.equalTo(18)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordField.snp.bottom).offset(16)
            $0.height.equalTo(42)
            $0.leading.trailing.equalToSuperview().inset(69)
            $0.centerX.equalTo(view)
        }
        
        signUpTextStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(16)
            $0.centerX.equalTo(view)
        }
        
        findingPasswordButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-44)
            $0.centerX.equalTo(view)
        }
        
        
    }

    
    

}

