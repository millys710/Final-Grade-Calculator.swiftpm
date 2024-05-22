import SwiftUI

struct ContentView: View {
    
    @State var currentGrade: Int = 0
    @State var desiredGrade: Int = 0
    @State var examPercent: Int = 0
    @State var showingAlert = false
    @State var stepOne = 0
    @State var steptwo = 0
    @State var stepThree = 0
    @State var neededGrade = 0
    
    var body: some View {
        ZStack{
            Color.gray
            Text("Final Grade Calculator")
                .position(x: 210, y: 160)
                .font(.title)
            VStack{
                Text("Enter Your Current Grade")
                    .foregroundColor(.black)
                    .font(.headline)
                TextField("Enter Your Current Grade", value: $currentGrade, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                Text("Enter Your Desired Final Grade")
                    .foregroundColor(.black)
                    .font(.headline)
                TextField("Enter Your Desired Final Grade", value: $desiredGrade, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                Text("Enter the Percentage The Exam is Worth")
                    .foregroundColor(.black)
                    .font(.headline)
                TextField("Enter the percentage the exam is worth as a decimal", value: $examPercent, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
              //      .onSubmit{
//                        @State var stepOne = (1 - (examPercent / 100))
//                        @State var steptwo = (stepOne * currentGrade)
//                        @State var stepThree = (desiredGrade - steptwo)
//                        @State var neededGrade = (stepThree / examPercent)
                //    }
                Button("Calculate Final Grade"){
                    showingAlert = true
                    stepOne = (1 - (examPercent / 100))
                    steptwo = (stepOne * currentGrade)
                    stepThree = (desiredGrade - steptwo)
                    neededGrade = (stepThree / examPercent)
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50, alignment: .center)
                .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                .padding(40)
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("You neeed a:"), 
                        message: Text("\(neededGrade)"), 
                        dismissButton: .default(Text("Got it!")))
                }
                
               
                }
            }
        }
    }
    
    //   lazy var stepOne = (1 - (examPercent / 100))
    //   lazy var steptwo = (stepOne * currentGrade)
    //   lazy var stepThree = (desiredGrade - steptwo)
    //   lazy var neededGrade = (stepThree / examPercent)
    
    //let neededGrade = (( desiredGrade - (1 - examPercent)) * currentGrade) / examPercent ))


