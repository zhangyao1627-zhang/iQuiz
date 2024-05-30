@_private(sourceFile: "ContentView.swift") import iQuiz
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import CoreData
import SwiftUI

extension ResultView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/zhangyao1627/Documents/Code/Swift/iQuiz/iQuiz/ContentView.swift", line: 211)
        VStack {
            Text(__designTimeString("#2518.[6].[3].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Quiz Result"))
            Text("Your Score: \(score) out of \(totalQuestionNumber)")
            Text(score == totalQuestionNumber ? __designTimeString("#2518.[6].[3].property.[0].[0].arg[0].value.[2].arg[0].value.then", fallback: "Perfect!") : __designTimeString("#2518.[6].[3].property.[0].[0].arg[0].value.[2].arg[0].value.else", fallback: "Try to Learn More!"))
            Button(__designTimeString("#2518.[6].[3].property.[0].[0].arg[0].value.[3].arg[0].value", fallback: "Back")) {
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(__designTimeInteger("#2518.[6].[3].property.[0].[0].arg[0].value.[3].modifier[3].arg[0].value", fallback: 10))
        }
        .navigationBarBackButtonHidden(__designTimeBoolean("#2518.[6].[3].property.[0].[0].modifier[0].arg[0].value", fallback: true))
        .navigationBarTitleDisplayMode(.inline)
    
#sourceLocation()
    }
}

extension QuestionView {
    @_dynamicReplacement(for: backgroundColor(for:)) private func __preview__backgroundColor(for idx: Int) -> Color {
        #sourceLocation(file: "/Users/zhangyao1627/Documents/Code/Swift/iQuiz/iQuiz/ContentView.swift", line: 190)
        if !submitted {
            return self.answerIndex == idx ? Color.blue : Color.gray
        } else {
            if idx == Int(question.answer) {
                return Color.green
            } else if idx == answerIndex {
                return Color.red
            } else {
                return Color.gray
            }
        }
    
#sourceLocation()
    }
}

extension QuestionView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/zhangyao1627/Documents/Code/Swift/iQuiz/iQuiz/ContentView.swift", line: 150)
        VStack(spacing: __designTimeInteger("#2518.[5].[6].property.[0].[0].arg[0].value", fallback: 10)) {
            Text(question.text)
                .font(.headline)
                .padding(.bottom, __designTimeInteger("#2518.[5].[6].property.[0].[0].arg[1].value.[0].modifier[1].arg[1].value", fallback: 100))
            ForEach(__designTimeInteger("#2518.[5].[6].property.[0].[0].arg[1].value.[1].arg[0].value.[0]", fallback: 0)..<question.answers.count, id: \.self) { index in
                Button(action: {
                    self.answerIndex = index
                }) {
                    Text(question.answers[index])
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: __designTimeInteger("#2518.[5].[6].property.[0].[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].modifier[2].arg[0].value", fallback: 0), maxWidth: __designTimeInteger("#2518.[5].[6].property.[0].[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].modifier[2].arg[1].value", fallback: 335))
                        .background(self.backgroundColor(for: index))
                        .cornerRadius(__designTimeInteger("#2518.[5].[6].property.[0].[0].arg[1].value.[1].arg[2].value.[0].arg[1].value.[0].modifier[4].arg[0].value", fallback: 10))
                }
            }
            
            if !submitted {
                Button(__designTimeString("#2518.[5].[6].property.[0].[0].arg[1].value.[2].[0].[0].arg[0].value", fallback: "Submit")) {
                    if answerIndex == Int(question.answer) {
                        score += __designTimeInteger("#2518.[5].[6].property.[0].[0].arg[1].value.[2].[0].[0].arg[1].value.[0].[0].[0].[0]", fallback: 1)
                    }
                    submitted = __designTimeBoolean("#2518.[5].[6].property.[0].[0].arg[1].value.[2].[0].[0].arg[1].value.[1].[0]", fallback: true)
                }
                .disabled(answerIndex == nil)
                .padding(.top, __designTimeInteger("#2518.[5].[6].property.[0].[0].arg[1].value.[2].[0].[0].modifier[1].arg[1].value", fallback: 50))
            } else {
                Button(__designTimeString("#2518.[5].[6].property.[0].[0].arg[1].value.[2].[1].[0].arg[0].value", fallback: "Next")) {
                    index += __designTimeInteger("#2518.[5].[6].property.[0].[0].arg[1].value.[2].[1].[0].arg[1].value.[0].[0]", fallback: 1)
                    submitted = __designTimeBoolean("#2518.[5].[6].property.[0].[0].arg[1].value.[2].[1].[0].arg[1].value.[1].[0]", fallback: false)
                    answerIndex = nil
                }
                .padding(.top, __designTimeInteger("#2518.[5].[6].property.[0].[0].arg[1].value.[2].[1].[0].modifier[0].arg[1].value", fallback: 50))
            }
        }
        .navigationBarBackButtonHidden(__designTimeBoolean("#2518.[5].[6].property.[0].[0].modifier[0].arg[0].value", fallback: true))
        .navigationBarTitleDisplayMode(.inline)
    
#sourceLocation()
    }
}

extension QuizDetailsView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/zhangyao1627/Documents/Code/Swift/iQuiz/iQuiz/ContentView.swift", line: 133)
        if index < category.questions.count {
            QuestionView(question: category.questions[index], score: $score, index: $index)
        } else {
            ResultView(score: score, totalQuestionNumber: category.questions.count)
        }
    
#sourceLocation()
    }
}

extension SettingsView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/zhangyao1627/Documents/Code/Swift/iQuiz/iQuiz/ContentView.swift", line: 115)
        Form {
            TextField(__designTimeString("#2518.[3].[3].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Data Source URL"), text: $dataSourceURL)
            Button(__designTimeString("#2518.[3].[3].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Check Out")) {
                reloadAction()
                showAlert = __designTimeBoolean("#2518.[3].[3].property.[0].[0].arg[0].value.[1].arg[1].value.[1].[0]", fallback: false)
            }
        }
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: fetchData(from:)) private func __preview__fetchData(from urlString: String) {
        #sourceLocation(file: "/Users/zhangyao1627/Documents/Code/Swift/iQuiz/iQuiz/ContentView.swift", line: 71)
        guard let url = URL(string: urlString) else {
            alertMessage = "Invalid URL"
            dataLoaded = false
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    alertMessage = "Fetch failed: \(error.localizedDescription)"
                    dataLoaded = __designTimeBoolean("#2518.[2].[7].[1].value.modifier[0].arg[1].value.[0].modifier[0].arg[0].value.[0].[0].[1].[0]", fallback: false)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200, let data = data else {
                    alertMessage = "Invalid response"
                    dataLoaded = false
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    self.quizData = try decoder.decode([Category].self, from: data)
                    dataLoaded = true
                } catch {
                    print(data)
                    alertMessage = "Data parsing failed"
                    dataLoaded = false
                    return
                }
            }
        }
        task.resume()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/zhangyao1627/Documents/Code/Swift/iQuiz/iQuiz/ContentView.swift", line: 21)
        NavigationView {
            Group {
                if dataLoaded {
                    List(quizData, id: \.title) { category in
                        NavigationLink(destination: QuizDetailsView(category: category)) {
                            HStack(spacing: __designTimeInteger("#2518.[2].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[2].value.[0].arg[1].value.[0].arg[0].value", fallback: 16)) {
                                Image(__designTimeString("#2518.[2].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[2].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value", fallback: "MeAvatar"))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: __designTimeInteger("#2518.[2].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[2].value.[0].arg[1].value.[0].arg[1].value.[0].modifier[2].arg[0].value", fallback: 40), height: __designTimeInteger("#2518.[2].[6].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[2].value.[0].arg[1].value.[0].arg[1].value.[0].modifier[2].arg[1].value", fallback: 40))
                                VStack(alignment: .leading) {
                                    Text(category.title)
                                        .font(.headline)
                                    Text(category.desc)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                } else {
                    Text(alertMessage)
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding()
                }
            }
            .onAppear {
                fetchData(from: dataSourceURL)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(__designTimeString("#2518.[2].[6].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "Quiz Categories"))
                        .font(.system(size: __designTimeInteger("#2518.[2].[6].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 20)))
                }
                ToolbarItem {
                    Button(__designTimeString("#2518.[2].[6].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Settings")) {
                       self.showAlert = __designTimeBoolean("#2518.[2].[6].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].[0]", fallback: true)
                    }
                }
            }
            .sheet(isPresented: $showAlert) {
                SettingsView(dataSourceURL: $dataSourceURL, showAlert: $showAlert, reloadAction: {
                        self.fetchData(from: dataSourceURL)
                    }
                )
            }
        }
    
#sourceLocation()
    }
}

import struct iQuiz.ContentView
import struct iQuiz.SettingsView
import struct iQuiz.QuizDetailsView
import struct iQuiz.QuestionView
import struct iQuiz.ResultView
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}



