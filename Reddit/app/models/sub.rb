# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord
  validates :title, presence: true

  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: :user,
    inverse_of: :subs
end
