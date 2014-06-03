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

@lesson = Lesson.create(
  title: 'How to train your dragon.',
  body: 'Dragons are seriously misunderstood creatures that are capable of building deep bonds with their companions. In this lesson you\'ll learn almost everything you need to know about how to capture, tame, and develop a long-lasting relationship with a dragon.',
  order: 0
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
    body: Forgery(:lorem_ipsum).paragraphs(4, random: true),
    metadata: Forgery(:lorem_ipsum).words(20, random: true),
    #terms: @terms[0]
  }),
  Section.create({
    lesson: @lesson,
    body: Forgery(:lorem_ipsum).paragraphs(4, random: true),
    metadata: Forgery(:lorem_ipsum).words(20, random: true),
    #terms: @terms[1]
  }),
  Section.create({
    lesson: @lesson,
    body: Forgery(:lorem_ipsum).paragraphs(4, random: true),
    metadata: Forgery(:lorem_ipsum).words(20, random: true),
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
    body: Forgery(:lorem_ipsum).title(random: true),
    answers: [
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: 'Correct Answer'),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
    ],
    correct_answer: 2,
    experience: 200,
    # reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    # hint: @hints[0]
  }),
  Question.create({
    section: @sections[1],
    body: Forgery(:lorem_ipsum).title(random: true),
    answers: [
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: 'Correct Answer'),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
    ],
    correct_answer: 1,
    experience: 200,
    # reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    # hint: @hints[1]
  }),
  Question.create({
    section: @sections[2],
    body: Forgery(:lorem_ipsum).title(random: true),
    answers: [
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: 'Correct Answer'),
    ],
    correct_answer: 3,
    experience: 200,
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

20.times.each do |n|


@lesson = Lesson.create(
  title: Forgery(:lorem_ipsum).title(random: true),
  body: Forgery(:lorem_ipsum).sentences(4, random: true),
  order: (n + 1)
)

@sections = [
  Section.create({
    lesson: @lesson,
    body: Forgery(:lorem_ipsum).paragraphs(4, random: true),
    metadata: Forgery(:lorem_ipsum).words(20, random: true),
    #terms: @terms[0]
  }),
  Section.create({
    lesson: @lesson,
    body: Forgery(:lorem_ipsum).paragraphs(2, random: true),
    metadata: Forgery(:lorem_ipsum).words(20, random: true),
    #terms: @terms[1]
  }),
  Section.create({
    lesson: @lesson,
    body: Forgery(:lorem_ipsum).paragraphs(3, random: true),
    metadata: Forgery(:lorem_ipsum).words(20, random: true),
    #terms: @terms[2]
  }),
]

@questions = [
  Question.create({
    section: @sections[0],
    body: Forgery(:lorem_ipsum).title(random: true),
    answers: [
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: 'Correct Answer'),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
    ],
    correct_answer: 2,
    experience: 200,
    # reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    # hint: @hints[0]
  }),
  Question.create({
    section: @sections[1],
    body: Forgery(:lorem_ipsum).title(random: true),
    answers: [
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: 'Correct Answer'),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
    ],
    correct_answer: 1,
    experience: 200,
    # reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    # hint: @hints[1]
  }),
  Question.create({
    section: @sections[2],
    body: Forgery(:lorem_ipsum).title(random: true),
    answers: [
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: Forgery(:lorem_ipsum).title(random: true)),
      Answer.new(body: 'Correct Answer'),
    ],
    correct_answer: 3,
    experience: 200,
    # reminders: ['Lorem Ipsum', 'Lorem Ipsum'],
    # hint: @hints[2]
  })
]

end

# create the player user after all lessons have been created
@player_user = User.create({
  email: 'player@user_test.com',
  encrypted_password: User.new.send(:password_digest, 'password'),
  role: 'authenticated'
})
