//
//  Repositoy.swift
//  bgweather
//
//  Created by Alejandro Agudelo on 11/10/20.
//  Copyright © 2020 Alejandro Agudelo. All rights reserved.
//

import Foundation

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
}

extension Encodable {
    func encode(with encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
}
