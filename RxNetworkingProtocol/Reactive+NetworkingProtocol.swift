//
//  Reactive+NetworkingProtocol.swift
//  RxNetworkingProtocols
//
//  Created by Patryk Mikolajczyk on 1/28/19.
//  Copyright © 2019 Patryk Mikolajczyk. All rights reserved.
//

import Foundation
import RxSwift
import NetworkingProtocol

public extension Reactive where Base: URLSessionProtocol {
    func getAllTasks() -> Single<[URLSessionTaskProtocol]> {
        return Single<[URLSessionTaskProtocol]>.create { single in
            self.base.getAllTasks { (tasks) in
                single(SingleEvent.success(tasks))
            }
            return Disposables.create { }
        }
    }
}

public extension Reactive where Base: ServiceProtocol {
    func dataTask(withRequest request: ServiceRequestProtocol) -> Single<Void> {
        return Single<Void>.create { single in
            let task = self.base.dataTask(withRequest: request) { (result: Result<Void, Error>) in
                switch result {
                case .success:
                    single(SingleEvent.success(()))
                case .failure(let err):
                    single(SingleEvent.error(err))
                }
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func dataTask<T>(withRequest request: ServiceRequestProtocol) -> Single<T> where T: Decodable {
        return Single<T>.create { single in
            let task = self.base.dataTask(withRequest: request) { (result: Result<T, Error>) in
                switch result {
                case .success(let val):
                    single(SingleEvent.success(val))
                case .failure(let err):
                    single(SingleEvent.error(err))
                }
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func uploadTask(withRequest request: ServiceRequestProtocol, fromFile fileURL: URL) -> Single<Void> {
        return Single<Void>.create { single in
            let task = self.base.uploadTask(withRequest: request, fromFile: fileURL) { (result: Result<Void, Error>) in
                switch result {
                case .success:
                    single(SingleEvent.success(()))
                case .failure(let err):
                    single(SingleEvent.error(err))
                }
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func uploadTask(withRequest request: ServiceRequestProtocol, from data: Data) -> Single<Void> {
        return Single<Void>.create { single in
            let task = self.base.uploadTask(withRequest: request, from: data) { (result: Result<Void, Error>) in
                switch result {
                case .success:
                    single(SingleEvent.success(()))
                case .failure(let err):
                    single(SingleEvent.error(err))
                }
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func downloadTask(withRequest request: ServiceRequestProtocol) -> Single<URL> {
        return Single<URL>.create { single in
            let task = self.base.downloadTask(withRequest: request) { (result: Result<URL, Error>) in
                switch result {
                case .success(let val):
                    single(SingleEvent.success(val))
                case .failure(let err):
                    single(SingleEvent.error(err))
                }
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func downloadTask(withResumeData resumeData: Data) -> Single<URL> {
        return Single<URL>.create { single in
            let task = self.base.downloadTask(withResumeData: resumeData) { (result: Result<URL, Error>) in
                switch result {
                case .success(let val):
                    single(SingleEvent.success(val))
                case .failure(let err):
                    single(SingleEvent.error(err))
                }
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
