//
//  RegisterUseCase.swift
//  SpaceFlightDemo
//
//  Created by Indo Teknologi Utama on 26/09/24.
//

class RegisterUseCase {
    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    func execute(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        authRepository.register(email: email, password: password, completion: completion)
    }
}
