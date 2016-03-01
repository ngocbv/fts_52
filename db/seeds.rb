User.create! email: "neversmile12b1@gmail.com",
  name: "Bach Van Ngoc",
  password: "12345678",
  role: 1
User.create! email: "neversmilek57clc@gmail.com",
  name: "Bach Van Ngoc",
  password: "12345678"

10.times do |n|
  subj = Subject.create! name: "Subject #{n}",
    duration: 1,
    question_num: 5
  10.times do |k|
  ques = Question.create! content: "Question #{k}",
    state: 1,
    subject: subj,
    created_by: 1,
    accepted_by: 1
    5.times do |l|
      n == 1 ? ans = true : ans = false
      Answer.create! content: "Answer #{l}",
        question: ques,
        correct: ans
      end
    end
  10.times do |k|
  ques = Question.create! content: "Question #{10 + k}",
    question_type: 1,
    state: 1,
    subject: subj,
    created_by: 1,
    accepted_by: 1
    5.times do |l|
      n == 1 || n == 2 ? ans = true : ans = false
      Answer.create! content: "Answer #{l}",
        question: ques,
        correct: ans
      end
    end
  10.times do |k|
  ques = Question.create! content: "Question #{20 + k}",
    question_type: 2,
    state: 1,
    subject: subj,
    created_by: 1,
    accepted_by: 1
    Answer.create! content: true,
      question: ques,
      correct: true
    end
end
