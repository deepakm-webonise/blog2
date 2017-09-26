10.times do
  Article.create(title: Faker::Lorem.sentence(3), text: Faker::Lorem.paragraphs(5).join("\n"))
end
