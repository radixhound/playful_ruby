class TurboDeviseController < ApplicationController
    class Responder < ActionController::Responder
      def to_turbo_stream
        if controller.controller_name == 'registrations'
          controller.render
        else
          controller.render(options.merge(formats: :html))
        end
      rescue ActionView::MissingTemplate => error
        if get?
          raise error
        elsif has_errors? && default_action
          render rendering_options.merge(formats: :html, status: :unprocessable_entity)
        else
          redirect_to navigation_location
        end
      end
    end
  
    self.responder = Responder
    respond_to :html, :turbo_stream
  end
  