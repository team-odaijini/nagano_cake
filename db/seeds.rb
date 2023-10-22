# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(id: 1, name: 'ケーキ')
Genre.create!(id: 2, name: 'プリン')
Genre.create!(id: 3, name: '焼き菓子')

Admin.create!(
    email: 'test@test',
    password: '123456',
    )
    
Customer.create!(
      id: 999,
      family_name: "令和",
      first_name: "昭子",
      family_name_kana: "レイワ",
      first_name_kana: "ショウコ",
      address: "東京",
      post_cord: "平成明治江戸",
      telephone_number: "000000000",
      email: "test@test",
      password: "098765",
    )    
    
10.times do |n|
    Customer.create!(
      family_name: "山田",
      first_name: "花子#{n + 1}",
      family_name_kana: "ヤマダ",
      first_name_kana: "ハナコ",
      address: "東京都千代田区永田町1-7-1",
      post_cord: "0000000",
      telephone_number: "123456789",
      email: "yamada#{n + 1}@tset.com",
      password: "111111",
    )    
end

