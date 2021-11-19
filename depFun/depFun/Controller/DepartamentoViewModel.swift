//
//  DepartamentoViewModel.swift
//  depFun
//
//  Created by Evosystems on 07/09/21.
//

import Foundation
import SwiftUI


class DepViewModel: ObservableObject
{
	@Published var items = [DepModel] ()
	@Published var joins = [DepJoin] ()
	@Published var joinsId = [DepJoin] ()
	
    
	let prefixUrl = "https://apicrudhacka.herokuapp.com"
	
	init(){
		fetchDep()
	 }
	
//	var filtro: [DepJoin] {
//	   self.filtro.filter({
//		   return $0.id_departamento == 5
//	   })
//   }
//
//
 
	func fetchDep() {
		guard let url = URL(string: "\(prefixUrl)/select/dep") else{
			print("Not Found url")
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.cachePolicy = .reloadIgnoringCacheData
		request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, res, error) in
			if error != nil {
				print("error", error?.localizedDescription ?? "" )
				return
			}
			
			do {
				if let data = data {
					let result = try JSONDecoder().decode(DepartamentoModel.self, from: data)
					DispatchQueue.main.sync{
						self.items = result.data
						self.joins = result.join
						 
						
					}
				}
				else {
					print("Sem dados")
				}
				
			}catch let JsonError {
				print("fetch json error:", JsonError.localizedDescription)
			}
		}.resume()
		
	}
	
	
	func fetchDeJoinId(id: [Int]){
		guard let url = URL(string: "\(prefixUrl)/selectjoin/dep") else{
			print("Not Found Url")
			return
		}
		
		let data = try! JSONSerialization.data(withJSONObject: id)
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.httpBody = data
		request.setValue("application/json", forHTTPHeaderField: "Content-type")
		
		URLSession.shared.dataTask(with: request) { (data, res, error) in
			if error != nil {
				print("Error", error?.localizedDescription ?? "")
				return
			}
			
			do{
				if let data = data {
					let result = try JSONDecoder().decode(DepartamentoModel.self, from: data)
					DispatchQueue.main.sync{
						self.joinsId = result.join
					
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
	
//	func fetchDepJoin() {
//		guard let url = URL(string: "\(prefixUrl)/selectjoin/dep") else{
//			print("Not Found url")
//			return
//		}
//
//
//		URLSession.shared.dataTask(with: url) { (data, res, error ) in
//			if error != nil {
//				print("error", error?.localizedDescription ?? "" )
//				return
//			}
//
//			do {
//				if let join = data {
//					let result = try JSONDecoder().decode(DepartamentoModel.self, from: join)
//					DispatchQueue.main.sync{
//						self.joins = result.join
//
//					}
//				}
//				else {
//					print("Sem dados")
//				}
//
//			}catch let JsonError {
//				print("fetch json error:", JsonError.localizedDescription)
//			}
//		}.resume()
//
//	}
	
	
	func createDep(parameters: [String: Any] ) {
		guard let url = URL(string: "\(prefixUrl)/create/dep") else{
			print("Not Found url")
			return
		}
		
		let data = try! JSONSerialization.data(withJSONObject: parameters)
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = data
		request.setValue("application/json", forHTTPHeaderField: "Content-type")
		
		URLSession.shared.dataTask(with: request) { (data, res, error ) in
			if error != nil {
				print("error", error?.localizedDescription ?? "" )
				return
			}
			
			do {
				if let data = data {
					let result = try JSONDecoder().decode(DepartamentoModel.self, from: data)
					DispatchQueue.main.sync{
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
	
	
	
	func updateDep(parameters: [String: Any] ) {
		guard let url = URL(string: "\(prefixUrl)/update/dep") else{
			print("Not Found url")
			return
		}
		
		let data = try! JSONSerialization.data(withJSONObject: parameters)
		var request = URLRequest(url: url)
		request.httpMethod = "PUT"
		request.httpBody = data
		request.setValue("application/json", forHTTPHeaderField: "Content-type")
		
		URLSession.shared.dataTask(with: request) { (data, res, error ) in
			if error != nil {
				print("error", error?.localizedDescription ?? "" )
				return
			}
			
			do {
				if let data = data {
					let result = try JSONDecoder().decode(DepartamentoModel.self, from: data)
					DispatchQueue.main.sync{
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
	
	
	
	
	func deleteDep(parameters: [String: Any] ) {
		guard let url = URL(string: "\(prefixUrl)/delete/dep") else{
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
					let result = try JSONDecoder().decode(DepartamentoModel.self, from: data)
					DispatchQueue.main.sync{
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

