//
//  LoginViewModel.swift
//  SpaceFlightDemo
//
//  Created by Indo Teknologi Utama on 26/09/24.
//

import Combine

@MainActor class LoginViewModel: ObservableObject {
    
    private let loginUseCase: LoginUseCase
    
    @Published var username = ""
    @Published var password = ""
    @Published var showPassword = false
    @Published var loginStatus: Bool = false
    @Published var errorMessage: String?
    
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    func login() {
        // Validate username and password
        // Make network request to authenticate user
        
        guard !username.isEmpty && !password.isEmpty else {
            // Handle empty username or password
            return
        }
        
        // Replace this with your actual authentication logic
        // For example, using a network request to a server
        // ...
        
        // Assuming successful authentication
        print("Login successful!")
    }
    func togglePassword() {
        showPassword.toggle()
    }
}
