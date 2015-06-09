require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pg')
require('./lib/list')
require('./lib/task')

DB = PG.connect(:dbname => "to_do")

get('/') do
  @all_lists = List.all()
  erb(:index)
end

post('/') do
  name = params.fetch('list_name')
  @list = List.new({:name => name, :id => nil})
  @list.save()
  redirect back
end

get('/lists/:id') do
  @list = List.find(params.fetch('id').to_i())
  erb(:list)
end

post('/list') do
  description = params.fetch('description')
  list_id = params.fetch('list_id').to_i()
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id})
  @task.save()
  redirect back
end
