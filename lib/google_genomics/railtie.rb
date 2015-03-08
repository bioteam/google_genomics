module GoogleGenomics
  class Railtie < ::Rails::Railtie

    require "#{Rails.root}/config/initializers/google_genomics"
    
    config.before_configuration do
      GoogleGenomics::Auth.new.authorize
    end

    config.after_initialize do
      #Google::APIClient.logger = Rails.logger
      Google::APIClient.logger = Logger.new("#{Rails.root}/log/google_genomics.log")
      #Logger.new(STDOUT)
    end

    rake_tasks do
      require "active_record/base"
    end

  end
end