require 'json'

file = File.read('app/assets/data.json')
data_hash = JSON.parse(file)

data_hash.each do |user_data|
  person = Person.create(name: user_data['name'], email: user_data['info']['email'])
  Detail.create(person: person, title: user_data['info']['title'], age: user_data['info']['age'], phone: user_data['info']['phone'] )
end
