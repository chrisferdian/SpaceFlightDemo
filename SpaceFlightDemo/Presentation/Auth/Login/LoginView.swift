//
//  LoginView.swift
//  SpaceFlightDemo
//
//  Created by Indo Teknologi Utama on 26/09/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = LoginViewModel(
        loginUseCase: AppDependency.shared.loginUseCase
    )

    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            
            TextField("email", text: $email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

                .overlay(
                    Button(action: { viewModel.togglePassword() }) {
                        Image(systemName: viewModel.showPassword ? "eye" : "eye.slash")
                    }
                    .padding(.trailing)
                )
            Button("Login") {
                viewModel.login()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    
}

#Preview {
    LoginView()
}

class AppDependency {
    static let shared = AppDependency()

    // Repositories
    var authRepository: AuthRepository {
        return AuthRepositoryImpl()
    }

    // Use Cases
    var loginUseCase: LoginUseCase {
        return LoginUseCase(authRepository: authRepository)
    }

    var registerUseCase: RegisterUseCase {
        return RegisterUseCase(authRepository: authRepository)
    }
}
