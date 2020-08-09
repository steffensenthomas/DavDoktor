//
//  NetworkServiceMock.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import Foundation

class NetworkServiceMock {
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        let data = Data(userData.utf8)
        completion(.success(data))
    }
}
