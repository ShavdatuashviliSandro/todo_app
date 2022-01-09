# frozen_string_literal: true

module PostInteractors
  # Created class
  class UpdatePost
    include Interactor

    def call
      case context.additional_params[:action]
      when 'draft'
        context.post.mark_as_draft!
      when 'moderation'
        context.post.process_on_moderation!
      when 'published'
        moderator = User.find(context.additional_params[:moderator_id])
        context.post.mark_as_published!(moderator)
      when 'canceled'
        moderator = User.find(context.additional_params[:moderator_id])
        context.post.mark_as_canceled!(moderator, context.additional_params[:cancellation_reason])
      when 'scheduled'
        context.post.process_scheduled!(context.params[:scheduled_at])
        SendTimeJob.set(wait_until: context.params[:scheduled_at].to_datetime - 4.hours).perform_later(context.post)
      else
        context.post.update!(context.params)
      end
    rescue => e
      context.post.errors.add(:base, e)
      context.fail!(message: e)
    end
  end
end
