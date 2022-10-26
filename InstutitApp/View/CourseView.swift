//
//  Courses.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/13/22.
//

import SwiftUI

struct CourseView: View {
    // MARK: - Property
    var msg:String
    var course:CourseModel
  
    @State private var isShownCourse:Bool = false
    @StateObject var vm = CoursesViewModel()
   @StateObject var dvm = DetailsViewModel()
    
    @Environment(\.presentationMode) var isPresended
    
    // MARK: - Body
    var body: some View {
       
        VStack {
            if course.img != "" {
                VStack {
                    ImageView(url: course.img, key: course.pid)
                            .scaledToFill()
                            .cornerRadius(15)
                            .onTapGesture {
                                isShownCourse.toggle()
                            }
                    
                   
                    
                    HStack( spacing: 15) {
                        Spacer()
                        VStack(alignment: .trailing, spacing: 5) {
                            Text(course.title)
                                .font(Font.custom("Cairo-Bold", size: 25))
                                .padding(.bottom, 5)
                            
                            Text(course.metaKeywords)
                                .font(Font.custom("Cairo-Regular", size: 20))
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                            
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical,10)
                        .padding(.bottom, 10)
                        
                      
                        
                    }
                    
                }
               
                .background(.gray.opacity(0.05))
                .cornerRadius(15)
                
                .padding()
                .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
                .sheet(isPresented: $isShownCourse) {
                    DetailView(pid:course.pid)
            }
            } else {
                
                Spacer()
                VStack (alignment:.center){
                    
                        ProgressView()
                    
                }
                .frame(minHeight:100)
                Spacer()
            }
        }
       
       
            
            
    }
}
//
//struct Courses_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseView(course: defaultCourses[0])
//    }
//}
