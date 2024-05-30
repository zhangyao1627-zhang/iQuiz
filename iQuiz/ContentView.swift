//
//  ContentView.swift
//  iQuiz
//
//  Created by Yao Zhang on 5/5/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var dataSourceURL = "http://tednewardsandbox.site44.com/questions.json"
    @State private var quizData: [Category] = []
    @State private var showAlert = false
    @State private var alertMessage = "Error"
    @State private var dataLoaded = false
    
    var body: some View {
        NavigationView {
            Group {
                if dataLoaded {
                    List(quizData, id: \.title) { category in
                        NavigationLink(destination: QuizDetailsView(category: category)) {
                            HStack(spacing: 16) {
                                Image("MeAvatar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
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
                    Text("Quiz Categories")
                        .font(.system(size: 20))
                }
                ToolbarItem {
                    Button("Settings") {
                       self.showAlert = true
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
    }
    
    func fetchData(from urlString: String) {
        guard let url = URL(string: urlString) else {
            alertMessage = "Invalid URL"
            dataLoaded = false
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    alertMessage = "Fetch failed: \(error.localizedDescription)"
                    dataLoaded = false
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
    }

}

struct SettingsView: View {
    @Binding var dataSourceURL: String
    @Binding var showAlert: Bool
    var reloadAction: () -> Void

    var body: some View {
        Form {
            TextField("Data Source URL", text: $dataSourceURL)
            Button("Check Out") {
                reloadAction()
                showAlert = false
            }
        }
    }
}


//To the questions Main Page
struct QuizDetailsView: View {
    var category: Category
    @State private var index = 0
    @State private var score = 0

    var body: some View {
        if index < category.questions.count {
            QuestionView(question: category.questions[index], score: $score, index: $index)
        } else {
            ResultView(score: score, totalQuestionNumber: category.questions.count)
        }
    }
}

//One Question -> One Result (Question Scene & Answer Scene) || Two Page in one
struct QuestionView: View {
    var question: Question
    @State private var submitted: Bool = false
    @State private var showNext: Bool = false
    @State private var answerIndex: Int?
    @Binding var score: Int
    @Binding var index: Int
    var body: some View {
        VStack(spacing: 10) {
            Text(question.text)
                .font(.headline)
                .padding(.bottom, 100)
            ForEach(0..<question.answers.count, id: \.self) { index in
                Button(action: {
                    self.answerIndex = index
                }) {
                    Text(question.answers[index])
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: 335)
                        .background(self.backgroundColor(for: index))
                        .cornerRadius(10)
                }
            }
            
            if !submitted {
                Button("Submit") {
                    if answerIndex == Int(question.answer) {
                        score += 1
                    }
                    submitted = true
                }
                .disabled(answerIndex == nil)
                .padding(.top, 50)
            } else {
                Button("Next") {
                    index += 1
                    submitted = false
                    answerIndex = nil
                }
                .padding(.top, 50)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func backgroundColor(for idx: Int) -> Color {
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
    }

}

struct ResultView: View {
    var score: Int
    var totalQuestionNumber: Int
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Quiz Result")
            Text("Your Score: \(score) out of \(totalQuestionNumber)")
            Text(score == totalQuestionNumber ? "Perfect!" : "Try to Learn More!")
            Button("Back") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

