class List
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    found_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    found_lists.each do |found_list|
      name = found_list.fetch("name")
      id = found_list.fetch("id").to_i()
      lists.push(List.new(:name => name, :id => id))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  define_method(:==) do |another_list|
    self.name().==(another_list.name()).&(self.id().==(another_list.id()))
  end

  define_singleton_method(:find) do |id|
    found_list = nil
    List.all().each() do |list|
      if list.id().==(id)
        found_list = list
      end
    end
    found_list
  end

  define_method(:tasks) do
    list_tasks = []
    all_tasks = DB.exec("SELECT * FROM tasks;")
    all_tasks.each do |task|
      list_id = task.fetch("list_id").to_i()
      description = task.fetch("description")
      if self.id().==(list_id)
        list_tasks.push(Task.new(:description => description, :list_id =>list_id ))
      end
    end
    list_tasks
  end
end
