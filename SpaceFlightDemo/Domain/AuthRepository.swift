//
//  AuthRepository.swift
//  SpaceFlightDemo
//
//  Created by Indo Teknologi Utama on 26/09/24.
//

protocol AuthRepository {
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func register(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}
