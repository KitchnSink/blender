# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({
  email: 'test_user@user_test.com',
  encrypted_password: User.new.send(:password_digest, 'password'),
  role: 'authenticated'
})

@player_user = User.create({
  email: 'player@user_test.com',
  encrypted_password: User.new.send(:password_digest, 'password'),
  role: 'authenticated'
})

@lesson = Lesson.create(
  title: 'How to train your dragon.',
  description: 'Dragons are seriously misunderstood creatures that are capable of building deep bonds with their companions. In this lesson you\'ll learn almost everything you need to know about how to capture, tame, and develop a long-lasting relationship with a dragon.',
  order: 1
)

# @terms = [
#   [
#     Term.create({
#       title: 'Lorem Ipsum',
#       body: 'Lorem Ipsum'
#     })
#   ],
#   [
#     Term.create({
#       title: 'Lorem Ipsum',
#       body: 'Lorem Ipsum'
#     }),
#     Term.create({
#       title: 'Lorem Ipsum',
#       body: 'Lorem Ipsum'
#     })
#   ],
#   [
#     Term.create({
#       title: 'Lorem Ipsum',
#       body: 'Lorem Ipsum'
#     }),
#     Term.create({
#       title: 'Lorem Ipsum',
#       body: 'Lorem Ipsum'
#     })
#   ]
# ]

@sections = [
  Section.create({
    lesson: @lesson,
    body: 'Lorem Ipsum',
    metadata: 'Lorem Ipsum',
    #terms: @terms[0]
  }),
  Section.create({
    lesson: @lesson,
    body: 'Lorem Ipsum',
    metadata: 'Lorem Ipsum',
    #terms: @terms[1]
  }),
  Section.create({
    lesson: @lesson,
    body: 'Lorem Ipsum',
    metadata: 'Lorem Ipsum',
    #terms: @terms[2]
  }),
]

# @hints = [
#   Hint.create({
#     body: 'Lorem Ipsum',
#     exp_cost: 50
#   }),
#   Hint.create({
#     body: 'Lorem Ipsum',
#     exp_cost: 50
#   }),
#   Hint.create({
#     body: 'Lorem Ipsum',
#     exp_cost: 50
#   })
# ]

@questions = [
  Question.create({
    section: @sections[0],
    body: 'Question 1',
    answers: [
      'Lorem Ipsum',
      'Lorem Ipsum',
      'Correct Answer',
      'Lorem Ipsum'
    ],
    correct_answer: 2,
    # reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    # hint: @hints[0]
  }),
  Question.create({
    section: @sections[1],
    body: 'Question 2',
    answers: [
      'Lorem Ipsum',
      'Correct Answer',
      'Lorem Ipsum',
      'Lorem Ipsum'
    ],
    correct_answer: 1,
    # reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    # hint: @hints[1]
  }),
  Question.create({
    section: @sections[2],
    body: 'Question 3',
    answers: [
      'Lorem Ipsum',
      'Lorem Ipsum',
      'Lorem Ipsum',
      'Correct Answer'
    ],
    correct_answer: 3,
    # reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    # hint: @hints[2]
  })
]

# Challenge.create({
#   type: 'lesson',
#   polymorphic_id: @lesson.id,
#   questions: [@questions[0]]
# })

# Challenge.create({
#   type: 'lesson',
#   polymorphic_id: @lesson.id,
#   questions: [@questions[1]]
# })

# Challenge.create({
#   type: 'lesson',
#   polymorphic_id: @lesson.id,
#   questions: [@questions[2]]
# })

# Create an achievement, our user will earn it later
# @achievement = Achievement.create({
#   title: 'Dragon Tamer',
#   description: 'You finished the lesson "How to Train Your Dragon"!'
# })

