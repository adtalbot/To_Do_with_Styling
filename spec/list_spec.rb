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
end
