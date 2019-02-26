class Song < ActiveRecord::Base
validates :title, presence: true
validates :title, uniqueness: {scope: [:title, :release_year]}
validate :cannot_be_in_the_future
validate :released_without_year

private

def cannot_be_in_the_future
  if released && release_year.to_i > Time.now.year
    errors.add(:release_year, "can't be in the future")
  end
end

def released_without_year
  if released && release_year == nil
    errors.add(:release_year, "No release Year given")
  end
end

end
