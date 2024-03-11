after :users do
  quizzes = [
    {
      name: "Biology Test",
      questions: [
        {
          content: "What is the water molecule?",
          value: 1,
          options: [
            { content: "H2O", correct: true },
            { content: "Co2", correct: false },
          ],
        },
        {
          content: "Which organelle is responsible for protein synthesis?",
          value: 1,
          options: [
            { content: "Ribosome", correct: true },
            { content: "Golgi Apparatus", correct: false },
          ],
        },
        {
          content: "What is the function of red blood cells?",
          value: 1,
          options: [
            { content: "Oxygen transport", correct: true },
            { content: "Digestion", correct: false },
          ],
        },
      ],
    },
    {
      name: "History Quiz",
      questions: [
        {
          content: "Who wrote the 'Declaration of Independence'?",
          value: 1,
          options: [
            { content: "Thomas Jefferson", correct: true },
            { content: "Benjamin Franklin", correct: false },
          ],
        },
        {
          content: "In which year did World War II end?",
          value: 1,
          options: [
            { content: "1945", correct: true },
            { content: "1918", correct: false },
          ],
        },
        {
          content: "What ancient civilization built the pyramids of Giza?",
          value: 1,
          options: [
            { content: "Egyptians", correct: true },
            { content: "Romans", correct: false },
          ],
        },
      ],
    },
    {
      name: "Mathematics Challenge",
      questions: [
        {
          content: "What is the square root of 64?",
          value: 1,
          options: [
            { content: "8", correct: true },
            { content: "6", correct: false },
          ],
        },
        {
          content: "Solve for x: 2x + 5 = 15",
          value: 1,
          options: [
            { content: "5", correct: true },
            { content: "10", correct: false },
          ],
        },
        {
          content: "What is the area of a rectangle with length 10 and width 6?",
          value: 1,
          options: [
            { content: "60", correct: true },
            { content: "36", correct: false },
          ],
        },
      ],
    },
  ]
  
  teacher = User.with_role(:teacher).first

  quizzes.each do |quiz|
    saved_quiz = Quiz.new(name: quiz[:name])
    saved_quiz.save

    UserQuiz.create!(user: teacher, quiz: saved_quiz)

    quiz[:questions].each do |question|
      to_save_question = Question.new(content: question[:content], quiz: saved_quiz, value: question[:value])
      
      question[:options].each do |option|
        to_save_question.options.new(content: option[:content], correct: option[:correct])
      end

      to_save_question.save
    end
  end  
end
