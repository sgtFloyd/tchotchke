module XMLHelper
  class << self

    def hpricot_to_hash( xml )
      recurse_element( xml.root )
    end

  private

    def recurse_element( ele )
      # TODO: recursively build hash from xml
    end

    def generate_name( ele )
      name = "#{ele.name}"
      ele.attributes.to_hash.each do |key, val|
        name += "_#{key}_#{val}"
      end
      name.to_sym
    end

  end
end