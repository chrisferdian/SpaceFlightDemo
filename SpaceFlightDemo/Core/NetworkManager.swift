//
//  NetworkManager.swift
//  SpaceFlightDemo
//
//  Created by Indo Teknologi Utama on 28/09/24.
//

import Foundation

class NetworkManager: NSObject, URLSessionDelegate {

    static let shared = NetworkManager()

    // URLSession configuration with SSL Pinning
    func getSecureSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }

    // URLSessionDelegate method to validate SSL Pinning
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        guard let serverTrust = challenge.protectionSpace.serverTrust,
              let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        let localCertificateData = loadLocalCertificate()

        // Compare server certificate with local certificate
        let serverCertificateData = SecCertificateCopyData(certificate) as Data

        if serverCertificateData == localCertificateData {
            // Certificates match, proceed with connection
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            // Certificates do not match, cancel connection
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }

    // Load local certificate from bundle
    private func loadLocalCertificate() -> Data? {
        guard let certPath = Bundle.main.path(forResource: "your_certificate", ofType: "cer"),
              let certData = try? Data(contentsOf: URL(fileURLWithPath: certPath)) else {
            return nil
        }
        return certData
    }
}
