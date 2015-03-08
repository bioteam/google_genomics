module GoogleGenomics
  class InstallGenerator < ::Rails::Generators::Base

    source_root File.expand_path("../../../templates", __FILE__)

    desc "Creates a GoogleGenomics initializer."
    #class_option :orm

    def copy_initializer
      say_status("installing", "GoogleGenomics", :green)
      copy_file "google_genomics.rb.erb", "config/initializers/google_genomics.rb"
    end

    def show_readme
      readme "README" if behavior == :invoke
    end

  end
end
