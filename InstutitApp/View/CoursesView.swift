
//  CoursesView.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/13/22.
//

import SwiftUI

struct CoursesView: View {
    @State var cid:String
    @StateObject var vm = CoursesViewModel()
    @Environment(\.presentationMode) var isPresended
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Button {
                    isPresended.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()

            }
            .padding()
            .padding(.bottom, 10)
            VStack(alignment: .center, spacing: 0) {
                ForEach(vm.allItems?.data ?? defaultCourses ,id: \.self) {course in
                    CourseView(msg:vm.allItems?.msg ?? "", course: course)
                }
            }
            .onAppear {
                let parameters:[String:Any] = ["action": "coursesGet","CID": cid]
                vm.getAllCats(parameters: parameters )
                
            }


            FooterView()
        }

        .padding(10)


    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView(cid: "1")
    }
}
