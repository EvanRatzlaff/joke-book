# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Joke.create([{ title: 'Vegans' }, { content: 'I like to think that vegans are the grassfed beef of Humanity'}])
Room.create([{ name: 'Punchline' }, { location: 'orlando' }])
User.create([{username: 'Funnyguy123'}, {email: 'test@test.com'}, {password: 'test123'}])
