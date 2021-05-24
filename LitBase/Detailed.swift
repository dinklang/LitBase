//
//  Detailed.swift
//  LitDatabase
//
//  Created by Sandro Dinklang on 5/16/21.
//

import SwiftUI

struct Detailed: View {
    
    @ObservedObject var blueButtonVM: BlueButtonViewModel
//    @ObservedObject var blueButtonVM = HomeViewModel().blueButtonViewModels[1]
    @Binding var showDetail: Bool
    
    @State var tmp = ""
    
    var onCommit: (Task) -> (Void) = { _ in }
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: { showDetail.toggle() }) {
                        Image(systemName: "chevron.backward")
                            .frame(width: 20, height: 20)
                    }
                    .frame(width: 35, height: 35)
                    .background(Color("blue1"))
                    .cornerRadius(10)
                    Spacer()
                }
    
                Text("Edit task")
                    .padding(30)
                
            }
            
            ZStack (alignment: .leading) {
                VStack {
                    TextField("", text: $blueButtonVM.task.title)
                        .padding(20)
                        .font(.largeTitle)
                    
                    TextField("", text: $blueButtonVM.task.subtitle)
                        .padding(20)
                        .font(.title)
                    
                    Spacer()
                    HStack {
                        Image(systemName: "person")
                        Text("People: \(blueButtonVM.task.people)")
                            .font(.title2)
                    }
                        
                    Spacer()
                    Button(action: { blueButtonVM.task.completed.toggle() }) {
                        Text(blueButtonVM.task.completed ? "Completed" : "Incomplete")
                    }
                    .frame(width: 250, height: 50)
                    .background(Color("blue1"))
                    .cornerRadius(15)
                }

            }
        }
        .padding([.bottom, .trailing, .leading], 10)
        .foregroundColor(.white)
        .background(Color("black1").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}

//struct Detailed_Previews: PreviewProvider {
//    static var previews: some View {
//        Detailed()
//    }
//}
