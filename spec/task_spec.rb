require('spec_helper')


describe(Task) do
  describe('#description') do
    it('returns the description of a instance of task') do
      test_task = Task.new(:description => "Wash the car.", :list_id => 1)
      expect(test_task.description()).to(eq("Wash the car."))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves an instance of task to an array') do
      test_task = Task.new(:description => "Fun", :list_id => 1)
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end
  describe('#==') do
    it('is the same task if it has the same description and list_id') do
      test_task = Task.new({:description => 'Wash the dog', :list_id => 1})
      test_task2 = Task.new({:description => 'Wash the dog', :list_id => 1})
      expect(test_task).to(eq(test_task2))
    end
  end
end
