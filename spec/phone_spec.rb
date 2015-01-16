require('rspec')
require('phone')

describe('Phone') do
  before() do
    Phone.clear()
  end

  describe('#type') do
    it('returns the type') do
      test_number = Phone.new({:type => 'Ghosts', :number => 5552368})
      expect(test_number.type()).to(eq('Ghosts'))
    end
  end

  describe('#number') do
    it('returns the type') do
      test_number = Phone.new({:type => 'Ghosts', :number => 5552368})
      expect(test_number.number()).to(eq(5552368))
    end
  end

  describe('#id') do
    it('returns the id of a number') do
      test_number = Phone.new({:type => 'Plow', :number => 5553226})
      expect(test_number.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('adds a contact to the list of saved contacts') do
      test_number = Phone.new({:type => 'Wrong', :number => 6060842})
      test_number.save()
      expect(Phone.all()).to(eq([test_number]))
    end
  end

  describe('.all') do
    it('returns an empty list if no contacts have been saved yet') do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('returns an empty list after contacts have been saved and then cleared') do
      Phone.new({:type => 'Wall', :number => 8675309}).save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a contact by a given id number') do
      test_number = Phone.new({:type => 'Mobile',  :number => 5556162})
      test_number.save()
      test_number2 = Phone.new({:type => 'Wall', :number => 8675309})
      test_number2.save()
      expect(Phone.find(test_number2.id())).to(eq(test_number2))
    end
  end

end
