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

@player_status = Status.create({
  total_hearts: 10,
  max_hearts: 10,
  total_experience: 0,
  next_available_lesson: null
})

@player_obejct = Player.create({
  user_id: @player_user.id,
  gameData: {},
  status: @player_status
})

@lesson = Lesson.create(
  title: 'How to train your dragon.',
  description: 'Dragons are seriously misunderstood creatures that are capable of building deep bonds with their companions. In this lesson you\'ll learn almost everything you need to know about how to capture, tame, and develop a long-lasting relationship with a dragon.',
  order: 1
)

@terms = [
  [
    Term.create({
      title: 'Lorem Ipsum',
      body: 'Lorem Ipsum'
    })
  ],
  [
    Term.create({
      title: 'Lorem Ipsum',
      body: 'Lorem Ipsum'
    }),
    Term.create({
      title: 'Lorem Ipsum',
      body: 'Lorem Ipsum'
    })
  ],
  [
    Term.create({
      title: 'Lorem Ipsum',
      body: 'Lorem Ipsum'
    }),
    Term.create({
      title: 'Lorem Ipsum',
      body: 'Lorem Ipsum'
    })
  ]
]

@sections = [
  Section.create({
    body: 'Lorem Ipsum',
    summary: 'Lorem Ipsum',
    challenges: @challenges,
    terms: @terms[0]
  }),
  Section.create({
    body: 'Lorem Ipsum',
    summary: 'Lorem Ipsum',
    challenges: @challenges,
    terms: @terms[1]
  }),
  Section.create({
    body: 'Lorem Ipsum',
    summary: 'Lorem Ipsum',
    challenges: @challenges,
    terms: @terms[2]
  }),
]

@lesson.sections << @sections

@hints = [
  Hint.create({
    body: 'Lorem Ipsum',
    exp_cost: 50
  }),
  Hint.create({
    body: 'Lorem Ipsum',
    exp_cost: 50
  }),
  Hint.create({
    body: 'Lorem Ipsum',
    exp_cost: 50
  })
]

@questions = [
  Question.create({
    question: 'Question 1',
    answers: [
      'Lorem Ipsum',
      'Lorem Ipsum',
      'Correct Answer',
      'Lorem Ipsum'
    ],
    correct_answer_key: 2,
    reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    hint: @hints[0]
  }),
  Question.create({
    question: 'Question 2',
    answers: [
      'Lorem Ipsum',
      'Correct Answer',
      'Lorem Ipsum',
      'Lorem Ipsum'
    ],
    correct_answer_key: 1,
    reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    hint: @hints[1]
  }),
  Question.create({
    question: 'Question 3',
    answers: [
      'Lorem Ipsum',
      'Lorem Ipsum',
      'Lorem Ipsum',
      'Correct Answer'
    ],
    correct_answer_key: 3,
    reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    hint: @hints[2]
  })
]

# add experience to questions
Experience.create({
  total: 100,
  type: :question,
  polymorphic_ids: @questions[0].id,
  user: @player_user.id
})

# add experience to questions
Experience.create({
  total: 100,
  type: :question,
  polymorphic_ids: @questions[1].id,
  user: @player_user.id
})

# add experience to questions
Experience.create({
  total: 100,
  type: :question,
  polymorphic_ids: @questions[2].id,
  user: @player_user.id
})

Challenge.create({
  type: 'lesson',
  polymorphic_id: @lesson.id,
  questions: [@questions[0]]
})

Challenge.create({
  type: 'lesson',
  polymorphic_id: @lesson.id,
  questions: [@questions[1]]
})

Challenge.create({
  type: 'lesson',
  polymorphic_id: @lesson.id,
  questions: [@questions[2]]
})

Experience.create({
  total: 500,
  type: :lesson,
  polymorphic_ids: [@lesson.id]
})

# Create an achievement, our user will earn it later
@achievement = Achievement.create({
  title: 'Dragon Tamer',
  description: 'You finished the lesson "How to Train Your Dragon"!'
})

Experience.create({
  total: 50,
  type: :achievement,
  polymorphic_ids: [@achievement.id]
})

