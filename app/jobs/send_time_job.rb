# frozen_string_literal: true

# Created class for sidekiq
class SendTimeJob < ApplicationJob
  queue_as :posts

  def perform(*args)
    posts = args.first
    posts.process_on_moderation!
  end
end


