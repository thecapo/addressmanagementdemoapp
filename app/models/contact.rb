class Contact < ApplicationRecord
  validates_presence_of :last_name, :telephone
  belongs_to :user
  def self.search(term)
    if term.present?
      where('last_name || first_name || address1 || address2 || city || zip || country || telephone LIKE ?', "%#{term}%")
    else
      all
    end
  end
end


