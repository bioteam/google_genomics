require "active_support/core_ext/module/attribute_accessors"

module GoogleGenomics
  class Config

    def self.setup
      yield self
    end

    mattr_accessor  :pass_phrase,
                    :key_file,
                    :scope,
                    :email,
                    :retries
  end
end
