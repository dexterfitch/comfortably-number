class Contact
  @@all_contacts = []

  define_method(:initialize) do |name|
    @name = name
    @numbers = []
    @id = @@all_contacts.length() + 1
  end

  define_method(:name) do
    @name
  end

  define_method(:id) do
    @id
  end

  define_method(:numbers) do
    @numbers
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
