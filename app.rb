require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/phone')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  name = params['name']
  Contact.new({:name => name}).save()
  @contacts = Contact.all()
  erb(:index)
end

post('/numbers') do
  type = params['type']
  number = params['number']
  @number = Phone.new({:type => type, :number => number})
  @number.save()
  @contact = Contact.find(params['contact_id'].to_i())
  @contact.add_number(@number)
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params['id'].to_i())
  erb(:contacts)
end
