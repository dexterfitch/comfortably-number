require('rspec')
require('contact')
require('phone')

describe('Contact') do
  before() do
    Contact.clear()
  end

  describe('#name') do
    it('returns a contact\'s name') do
      test_contact = Contact.new({:name => 'Hester Stanhope'})
      expect(test_contact.name()).to(eq('Hester Stanhope'))
    end
  end

  describe('#id') do
    it('returns the id of a contact') do
      test_contact = Contact.new({:name => 'Hypatia'})
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('adds a contact to the list of saved contacts') do
      test_contact = Contact.new({:name => 'Ching Shih'})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('#add_number') do
    it('adds a new number to the list of stored numbers') do
      test_contact = Contact.new({:name => 'Katie Sandwina'})
      test_number = Phone.new({:type => 'Home', :number => 5558080})
      test_contact.add_number(test_number)
      expect(test_contact.numbers()).to(eq([test_number]))
    end
  end

  describe('.all') do
    it('returns an empty list if no contacts have been saved yet') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('returns an empty list after contacts have been saved and then cleared') do
      Contact.new({:name => 'Julie d\'Aubigny'}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a contact by a given id number') do
      test_contact = Contact.new({:name => 'Shajar al-Durr'})
      test_contact.save()
      test_contact2 = Contact.new({:name => 'Osh-Tisch'})
      test_contact2.save()
      expect(Contact.find(test_contact2.id())).to(eq(test_contact2))
    end
  end

end
