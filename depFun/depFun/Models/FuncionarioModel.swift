//
//  FuncionarioModel.swift
//  depFun
//
//  Created by Evosystems on 08/09/21.
//

import Foundation

struct FuncionarioModel: Decodable {
	let error: Bool
	let message: String
	let data: [FunModel]
}

struct FunModel: Decodable {
	let id : Int
	let nome : String
	let id_departamento: Int
	let rg : Int
	}
