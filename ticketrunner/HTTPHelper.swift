//
//  HTTPHelper.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.07.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import Foundation

enum HTTPRequestAuthType {
    case httpBasicAuth
    case httpTokenAuth
}

enum HTTPRequestContentType {
    case httpJsonContent
    case httpMultipartContent
}

struct HTTPHelper {
    
    static let API_AUTH_NAME = "<YOUR_HEROKU_API_ADMIN_NAME>"
    static let API_AUTH_PASSWORD = "<YOUR_HEROKU_API_PASSWORD>"
    static let BASE_URL = "https://XXXXX-XXX-1234.herokuapp.com/api"
    
    func buildRequest(_ path: String, method: String, authType: HTTPRequestAuthType, requestContentType: HTTPRequestContentType = HTTPRequestContentType.httpJsonContent, requestBoundary: String = "") -> NSMutableURLRequest {
        
        //1. Create request url from path
        guard let requestURL = URL(string: "\(HTTPHelper.BASE_URL)/\(path)") else { return NSMutableURLRequest() }
        var request = NSMutableURLRequest(url: requestURL)
        
        //Set http method and content type
        request.httpMethod = method
        
        //2. set content Type
        switch requestContentType {
        case .httpJsonContent:
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        case .httpMultipartContent:
            let contentType = "multipart/form-data; boundary=\(requestBoundary)"
            request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        }
        
        //3. Set the correct authorization header
        
        switch authType {
        case .httpBasicAuth:
            let basicAuthString = "\(HTTPHelper.API_AUTH_NAME):\(HTTPHelper.API_AUTH_PASSWORD)"
            let utf8str = basicAuthString.data(using: String.Encoding.utf8)
            let base64EncodedString = utf8str?.base64EncodedString(options: NSData.Base64EncodingOptions())
            
            request.addValue("Basic \(String(describing: base64EncodedString))", forHTTPHeaderField: "Authorization")
            
            
        case .httpTokenAuth:
            if let userToken = KeychainAccess.passwordForAccount("Auth_Token", service: "KeyChainService") as String? {
                request.addValue("Token token=\(userToken)", forHTTPHeaderField: "Authorization")
            }
        }
        return request
    }
    
    func sendRequest(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> () {
        // Create URL Session Task
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                
                DispatchQueue.main.async {
                    completion(data, error)
                }
                
                return
            }
            DispatchQueue.main.async {
                guard let httpResponse = response as? HTTPURLResponse else { return }
                
                if httpResponse.statusCode == 200 {
                    completion(data, nil)
                }
                else {
                    guard let data = data else { return }
                    
                    let reponseError = self.createErrorDict(data: data, httpResponse: httpResponse)
                    completion(data, reponseError)
                }
            }
            
        }
        
        task.resume()
        
    }
    
    func uploadRequest(path: String, data: Data, title: String) -> NSMutableURLRequest {
        let boundary = "---------------------------14737809831466499882746641449"
        let request = buildRequest(path, method: "POST", authType: .httpTokenAuth, requestContentType: .httpMultipartContent, requestBoundary: boundary) as NSMutableURLRequest
        
        let bodyParams: NSMutableData = NSMutableData()
        
        //build & format http body with data
        //prepare for multipart upload
        
        let boundaryString = "--\(boundary)\r\n"
        guard let boundaryData = boundaryString.data(using: String.Encoding.utf8) else { return NSMutableURLRequest() }
        bodyParams.append(boundaryData)
        
        //set parameter name
        guard let imageMetaData = "Content-Disposition: attachment; name=\"image\"; filename=\"photo\"\r\n".data(using: String.Encoding.utf8, allowLossyConversion: false) else { return NSMutableURLRequest() }
        bodyParams.append(imageMetaData)
        
        //set the content type
        guard let fileContentType = "Content-Type: application/octet-stream\r\n\r\n".data(using: String.Encoding.utf8, allowLossyConversion: false) else { return NSMutableURLRequest() }
        bodyParams.append(fileContentType)
        
        //add actual image data
        bodyParams.append(data)
        
        let imageDataEnding = "\r\n".data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        
        let secBoundaryString = "--\(boundary)\r\n"
        guard let secBoundaryData = secBoundaryString.data(using: String.Encoding.utf8) else { return NSMutableURLRequest() }
        
        bodyParams.append(secBoundaryData)
        
        
        //pass caption of the image
        guard let formData = "Content-Disposition: formData; name\"title\"\r\n\r\n".data(using: String.Encoding.utf8, allowLossyConversion: false) else { return NSMutableURLRequest() }
        bodyParams.append(formData)
        
        guard let secFormData = title.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return NSMutableURLRequest() }
        bodyParams.append(secFormData)
        
        guard let closingFormData = "\r\n".data(using: String.Encoding.utf8, allowLossyConversion: false) else { return NSMutableURLRequest() }
        bodyParams.append(closingFormData)
        
        let closingData = "--\(boundary)--\r\n"
        guard let boundaryDataEnd = closingData.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return NSMutableURLRequest() }
        
        bodyParams.append(boundaryDataEnd)
        
        request.httpBody = bodyParams as Data
        return request
    }
    
    func getErrorMessage(error: NSError) -> String {
        var errorMessage: String
        
        if error.domain == "HTTPHelperError" {
            let userInfo = error.userInfo as NSDictionary
            errorMessage = userInfo.value(forKey: "message") as! String
        } else {
            errorMessage = error.description
        }
        
        return errorMessage
    }
    
    fileprivate func createErrorDict(data: Data, httpResponse: HTTPURLResponse) -> Error? {
        
        var errorDict: Dictionary<AnyHashable,Any>?
        
        do {
            errorDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<AnyHashable, Any>
            
            
        } catch let jsonError {
            print("Failed to create errorDict from Json: ", jsonError)
        }
        let responseError: Error = NSError(domain: "HTTPHelperError", code: httpResponse.statusCode, userInfo: errorDict as! [String : Any])
        
        return responseError
    }
    
}








