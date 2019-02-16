users_list = [
  ['Josh', 'josh@gmail.com', '12345'],
  ['Jeremy', 'jeremy@gmail.com', '12345'],
  ['Sara', 'Sara@gmail.com', '12345'],
  ['Rihanna', 'Rihanna@gmail.com', '12345'],
  ['Adam', 'Adam@gmail.com', '12345'],
]

users_list.each do |name, email, password|
  User.create(username: name, email: email, password: password)
end

affirmations_list = [
  ['Man, life is awesome, and so are you!', '1'],
  ['YOU ARE THE BEST', '1'],
  ['You are perfect, in every single way', '1'],
  ['Keep going!', '1'],
  ['I have so much faith in you', '1'],
  ['Live a lil', '2'],
  ['Keep on doing awesome things', '2'],
  ['I think you can do everything', '2'],
  ['Keep it up!', '2'],
  ['Wowwwwww, what a superstar!', '2'],
  ['I affirm you', '3'],
  ['I do not like writing these, but I like you, so I will', '3'],
  ['Amazingggggg', '3'],
  ['You can do amazing things', '3'],
  ['You do you boo boo', '3'],
  ['Aint no mountainnnnn high enoughhhhhhhh', '4'],
  ['Always do your best, and you will get where you want to go', '4'],
  ['Life has a way of coming back around', '4'],
  ['Live your best life', '5'],
  ['You are so funny', '5'],
  ['Write to be is as amazing as you are to me', '5'],
  ['I am tired of writing, but I will write more', '5'],
  ['Tell me how your day is!', '5'],
  ['Sweeettttt Carolineeeeee', '1'],
  ['Hey Judeeeeeee', '1'],
  ['Optimism runs through this website', '3'],
  ['Where am I?', '3'],
  ['Hmu with whats wrong, I am listening!', '5']
]


affirmations_list.each do |content, id|
  Affirmation.create(content: content, user_id: id)
end
