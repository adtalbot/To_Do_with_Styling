require('spec_helper')

describe(List) do
  describe('.all') do
    it('is empty at first') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('tells you its name') do
      test_list = List.new({:name => 'School', :id => nil})
      expect(test_list.name()).to(eq('School'))
    end
  end

  describe('#==') do
    it('returns two list objects as equal if they have the same name') do
      test_list = List.new(:name => "Chores", :id => nil)
      test_list2 = List.new(:name => "Chores", :id => nil)
      expect(test_list).to(eq(test_list2))
    end
  end

  describe('#save') do
    it('saves an instance of list to an array') do
      test_list = List.new(:name => "School", :id => nil)
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end
  describe('#id') do
    it('sets it id when you save it') do
      test_list = List.new({:name => 'School', :id => nil})
      test_list.save()
      expect(test_list.id()).to(be_an_instance_of(Fixnum))
    end
  end
  describe('.find') do
    it('returns a list by its id') do
      test_list = List.new({:name => 'Wash the dog', :id => nil})
      test_list.save()
      test_list2 = List.new({:name => 'Wash the dishes', :id => nil})
      test_list2.save()
      expect(List.find(test_list.id())).to(eq(test_list))
    end
  end
  describe('#tasks') do
    it('returns an array of tasks for that list') do
      test_list = List.new({:name => 'School stuff', :id => nil})
      test_list.save()
      test_task = Task.new({:description => 'Math', :list_id => test_list.id()})
      test_task.save()
      test_task2 = Task.new({:description => 'English', :list_id => test_list.id()})
      test_task2.save()
      expect(test_list.tasks).to(eq([test_task, test_task2]))
    end
  end
end
