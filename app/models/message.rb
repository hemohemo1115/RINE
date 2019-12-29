class Message < ApplicationRecord
  #belongs_to :user

  validates :content, presence: true
  validates :user_id, presence: true
  validates :user_name, presence: true
  # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
  after_create_commit { MessageBroadcastJob.perform_later self }
end
