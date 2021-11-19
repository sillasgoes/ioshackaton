//
//  DetailView.swift
//  depFun
//
//  Created by Evosystems on 07/09/21.
//

import SwiftUI

struct DetailView: View {
	@EnvironmentObject var viewModel: DepViewModel
	@EnvironmentObject var viewModelFun: FunViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var departamento = ""
	@State var id_departamento: Int = 0
    @State var nome = ""

    let item: [DepJoin]
	
	func funView(id: Int) -> [FunModel]{
		let result = viewModelFun.items.filter{item in
			item.id == id
		}
		return result
	}
   
 	var body: some View {
		NavigationView{
		
			List{
			ForEach(item, id: \.nome) { item in
				NavigationLink(
					destination: FunDetailView(item: funView(id: item.id)[0] ),
					label: {
						
						VStack(alignment: .leading){
							Text("\(item.nome)")
							   .bold()
							   .font(.title3)
					
						}
					}).frame(width: 350, height: 50)
				     
			 }
			}
			.listStyle(InsetListStyle())
			.navigationTitle(item[0].departamento)
		    .navigationBarBackButtonHidden(true)

		}
		.frame(width: 340, height: 680, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//		    ZStack{
//			Color.gray.opacity(0.1).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//			VStack(alignment: .leading){
//				Text("Editar Departamento").font(Font.system(size:16, weight: .bold))
//					.padding()
//				TextField("Sigla", text: $sigla)
//					.padding()
//					.background(Color.white)
//					.cornerRadius(6)
//					.padding()
//
//				TextField("Departamento", text: $departamento)
//					.padding()
//					.background(Color.white)
//					.cornerRadius(6)
//					.padding()
//
//
//				Spacer()
//			}.padding()
//			.onAppear(perform: {
//				self.sigla = item.sigla
//				self.departamento = item.departamento
//
//			})
//
//		}
//		.navigationBarTitle("Departamento", displayMode: .inline)
//		.navigationBarItems(trailing: trailing)
//			.frame(width: 350, height: 250)
//		Spacer()
//
//
//
//    }
//
//
//	var trailing: some View {
//		Button(action: {
//
//			if sigla != "" && departamento != "" {
//				presentationMode.wrappedValue.dismiss()
//				let parameters: [String: Any] = ["sigla": sigla, "departamento": departamento, "id": item.id]
//				viewModel.updateDep(parameters: parameters)
//				viewModel.fetchDep()
//
//			}else{
//
//			}
//		}, label: {
//			Text("Salvar")
//		})
//	}
//
	 }
	
	}
  
 
//struct DetailView_Previews: PreviewProvider {
//	 
//	static var previews: some View {
//		 
//		DetailView(item: [DepJoin.init(id_departamento: 34, nome: "Roberto", departamento: "FI" )])
//	}
//}


