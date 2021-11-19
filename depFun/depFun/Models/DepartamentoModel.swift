//
//  DepartamentoModel.swift
//  depFun
//
//  Created by Evosystems on 07/09/21.
//

import Foundation


struct DepartamentoModel: Decodable {
	let error: Bool
	let message: String
	let data: [DepModel]
	let join: [DepJoin]
}

struct DepModel: Decodable {
	let id : Int
	let sigla : String
	let departamento : String

	}

struct DepJoin: Decodable {
	let id: Int
	let id_departamento: Int
	let nome: String
	let departamento: String
	
}

