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
end
