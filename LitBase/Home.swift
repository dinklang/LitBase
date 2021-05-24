//
//  Home.swift
//  LitDatabase
//
//  Created by Sandro Dinklang on 5/11/21.
//

import SwiftUI

struct Home: View {
    @ObservedObject var homeVM = HomeViewModel()
    
    @State var placehold = ""
    
    var username = "Sandro"
    @State var showDetail = false
    @State var selectTask = 0
    
    var body: some View {
        ZStack {
                VStack {
                    VStack {
                        Text("LitBase")
                            .font(.largeTitle)
                        Text("Hello \(username). Welcome to LitBase")
                            .font(.body)
                            .padding(.top, 5)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding([.top, .bottom], 30)

                    ZStack(alignment: .leading) {
                        if placehold.isEmpty {
                            Text("Search place...")
                                .padding(.leading, 50)
                                .font(.body)
                        }
                        TextField("", text: $placehold)
                            .textFieldStyle(CustomTextField())
                            .padding([.leading, .trailing],30)
                            .font(.body)
                    }
                    
                    ScrollView {
                        ForEach(homeVM.blueButtonViewModels.indices, id: \.self
                        ) { vm in
                            BlueButtonView(
                                blueButtonVM: homeVM.blueButtonViewModels[vm],
                                showDetail: $showDetail,
                                selectTask: $selectTask,
                                index: vm)
                            
                        }
                    }.offset(y: 5)
                    
                    Button(action: { homeVM.addTask(task: Task(title: "Add title", subtitle: "Add subject", people: 1, completed: false))
                    } )
                    {
                        Text("Add new")
                    }
                    .frame(width: 250, height: 50)
                    .background(Color("blue1"))
                    .cornerRadius(15)
                    .padding(.top, 15)
                }
                .foregroundColor(.white)
                .background(Color("black1").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
            if showDetail {
                Detailed(blueButtonVM: homeVM.blueButtonViewModels[selectTask],
                         showDetail: $showDetail)
            }
        }
    }
}

struct BlueButtonView: View {
    
    @ObservedObject var blueButtonVM: BlueButtonViewModel
    @Binding var showDetail: Bool
    @Binding var selectTask: Int
    var index: Int
    
    var body: some View {
        VStack {
            Button(action: {
                self.showDetail.toggle()
                self.selectTask = index
            }) {
                VStack (alignment: .leading) {
                    HStack (spacing: 25){
                        Text(blueButtonVM.task.subtitle)
                        Text("\(blueButtonVM.task.people)")
                        Image(systemName: blueButtonVM.task.completed ? "checkmark.circle.fill" : "circle")
                        
                        Spacer()
                    }
                    .font(.footnote)
                    .padding(.leading, 10)

                    Spacer()
                    
                    
                    Text(blueButtonVM.task.title)
                        .font(.headline)

                }
                .padding(30)
                .frame(height: 170)
                .background(Color("blue2"))
            }
            .cornerRadius(25)
            .padding([.leading, .trailing], 30)
            .padding([.top, .bottom], 5)
        }

    }
}

struct CustomTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading, 20)
            .padding([.top, .bottom, .trailing], 15)
            .background(RoundedRectangle(cornerRadius: 15).strokeBorder(Color.white))
        }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
