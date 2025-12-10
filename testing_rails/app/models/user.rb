class User < ApplicationRecord
  enum :kind, {
    knight: 0,
    wizard: 1,
    ogre: 2
  }
  validates :level, numericality: { greater_than: 0, less_than_or_equal_to: 99 }

  def title
    "nickname: #{self.nickname} | kind: #{self.kind} | level: #{self.level}"
  end
end
