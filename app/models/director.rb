# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Director < ApplicationRecord
 # def filmography
 #   key = self.id

 #   the_many = Movie.where({ :director_id => key })

 #   return the_many
 # end

  has_many(:filmography, { :class_name => "Movie"})

  def actors
    the_many = Array.new

    self.filmography.each do |joining_record|
      destination_record = joining_record.cast

      the_many.push(destination_record)
    end

    return the_many.flatten
  end

end
