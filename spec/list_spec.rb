require('spec_helper')

describe(List) do
  describe('.all') do
    it('is empty at first') do
      expect(List.all()).to(eq([]))
    end
  end
end
