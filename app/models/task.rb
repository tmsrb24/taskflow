class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  acts_as_list scope: :project
  acts_as_taggable_on :tags

  validates :title, presence: true
end
