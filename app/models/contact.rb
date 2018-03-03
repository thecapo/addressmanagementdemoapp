class Contact < ApplicationRecord
  belongs_to :user
  def self.search(term)
    if term
      where('last_name || first_name LIKE ?', "%#{term}%")
    else
      all
    end
  end
end


