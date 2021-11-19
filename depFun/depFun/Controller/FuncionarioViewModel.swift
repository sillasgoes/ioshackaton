//
//  FuncionarioViewModel.swift
//  depFun
//
//  Created by Evosystems on 08/09/21.
//

import Foundation
import SwiftUI

class FunViewModel: ObservableObject
{
	
	@Published var items = [FunModel] ()
 
	
	let prefixUrl =  "https://apicrudhacka.herokuapp.com"
    
	init(){
	     fetchFun()
      }
	
	
	
	func fetchFun(){
		guard let url = URL(string: "\(prefixUrl)/select/fun") else{
			print("Not Found Url")
            return
		}
		
		var request = URLRequest(url: url)
		request.cachePolicy = .reloadIgnoringCacheData
		request.httpMethod = "GET"
		
		URLSession.shared.dataTask(with: request) { (data, res, error) in
			if error != nil {
				print("Error", error?.localizedDescription ?? "")
				return
			}
			
			do{
				if let data = data {
					let result = try JSONDecoder().decode(FuncionarioModel.self, from: data)
					DispatchQueue.main.sync{
						self.items = result.data
					}
				}
				else{
					print("Sem dados")
				}
			}catch let JsonError{
				print("fetch json error:", JsonError.localizedDescription)
			}
			  
		}.resume()
	}
	
	
	func createFun(parameters: [String: Any] ) {
		guard let url = URL(string: "\(prefixUrl)/create/fun") else{
			print("Not Found Url")
			return
		}
		
		let data = try! JSONSerialization.data(withJSONObject: parameters)
		var request = URLRequest(url: url)
		request.httpMethod = "PUT"
		request.httpBody = data
		request.setValue("applicatiion/json", forHTTPHeaderField: "Content-type")
		
		URLSession.shared.dataTask(with: url) { (data, res, error) in
			if error != nil {
				print("Error", error?.localizedDescription ?? "")
				return
			}
			
			do{
				if let data = data {
					let result = try JSONDecoder().decode(FuncionarioModel.self, from: data)
					DispatchQueue.main.sync{
						self.items = result.data
					}
				}
				else{
					print("Sem dados")
				}
			}catch let JsonError{
				print("fetch json error:", JsonError.localizedDescription)
			}
			  
		}.resume()
	}
	
	func updateFun(parameters: [String: Any] ) {
		guard let url = URL(string: "\(prefixUrl)/update/fun") else{
			print("Not Found Url")
			return
		}
		
		let data = try! JSONSerialization.data(withJSONObject: parameters)
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = data
		request.setValue("applicatiion/json", forHTTPHeaderField: "Content-type")
		
		URLSession.shared.dataTask(with: url) { (data, res, error) in
			if error != nil {
				print("Error", error?.localizedDescription ?? "")
				return
			}
			
			do{
				if let data = data {
					let result = try JSONDecoder().decode(FuncionarioModel.self, from: data)
					DispatchQueue.main.sync{
						self.items = result.data
					}
				}
				else{
					print("Sem dados")
				}
			}catch let JsonError{
				print("fetch json error:", JsonError.localizedDescription)
			}
			  
		}.resume()
	}
	
	
	
	func deleteFun(parameters: [String: Any] ) {
		guard let url = URL(string: "\(prefixUrl)/delete/fun") else{
			print("Not Found url")
			return
		}
		
		let data = try! JSONSerialization.data(withJSONObject: parameters)
		var request = URLRequest(url: url)
		request.httpMethod = "DELETE"
		request.httpBody = data
		request.setValue("application/json", forHTTPHeaderField: "Content-type")
		
		URLSession.shared.dataTask(with: request) { (data, res, error ) in
			if error != nil {
				print("error", error?.localizedDescription ?? "" )
				return
			}
			
			do {
				if let data = data {
					let result = try JSONDecoder().decode(FuncionarioModel.self, from: data)
					DispatchQueue.main.async{
						print(result)
					}
				}
				else {
					print("No data")
				}
				
			}catch let JsonError {
				print("fetch json error:", JsonError.localizedDescription)
			}
		}.resume()
		
	}
	
	
	
}
