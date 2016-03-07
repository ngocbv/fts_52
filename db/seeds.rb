User.create! email: "neversmile12b1@gmail.com",
  name: "Bach Van Ngoc",
  password: "12345678",
  role: 1
User.create! email: "neversmilek57clc@gmail.com",
  name: "Bach Van Ngoc",
  password: "12345678"
User.create! email: "admin@fts52.com",
  name: "Team FTS 52",
  password: "12345678",
  role: 1

5.times do
  subj = Subject.create! name: Faker::Lorem.word.capitalize,
    duration: 30.minutes,
    question_num: 20
  10.times do
    ques = Question.create! content: Faker::Lorem.sentence,
      state: 1,
      subject: subj,
      user_id: 1,
      accepted_by: 1
    4.times do |l|
      ans = l == 0
      Answer.create! content: Faker::Lorem.word.capitalize, question: ques, correct: ans
    end
  end
  10.times do
    ques = Question.create! content: Faker::Lorem.sentence,
      question_type: 1,
      state: 1,
      subject: subj,
      user_id: 1,
      accepted_by: 1
    5.times do |l|
      ans = l == 0 || l == 1
      Answer.create! content: Faker::Lorem.word.capitalize, question: ques, correct: ans
    end
  end
  10.times do
    ques = Question.create! content: Faker::Lorem.sentence,
      question_type: 2,
      state: 1,
      subject: subj,
      user_id: 1,
      accepted_by: 1
    Answer.create! content: "true", question: ques, correct: true
  end
end
