class Contact
  @@all_contacts = []
  attr_reader(:name, :numbers, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @numbers = []
    @id = @@all_contacts.length() + 1
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end

  define_method(:add_number) do |num|
    @numbers.push(num)
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@all_contacts.each() do |contact|
      if contact.id().eql?(id.to_i())
        found_contact = contact
      end
    end
    found_contact
  end
end
