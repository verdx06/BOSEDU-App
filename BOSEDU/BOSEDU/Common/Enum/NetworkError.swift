//
//  NetworkError.swift
//  BOSEDU
//
//  Created by Виталий Багаутдинов on 06.06.2025.
//

import Foundation

enum NetworkError: Error {
    case userNotExist // пользователя не существует
    case dublicateEmail // пользователь с таким email существует
    case serverError // ошибка связанная с сервером
}
