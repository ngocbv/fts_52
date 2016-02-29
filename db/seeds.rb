# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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
  10.times do |n|
  ques = Question.create! content: "Question #{n}",
    state: 1,
    subject: subj,
    created_by: 1,
    accepted_by: 1
    5.times do |n|
      n == 1 ? ans = true : ans = false
      Answer.create! content: "Answer 1",
        question: ques,
        correct: ans
      end
    end
end
