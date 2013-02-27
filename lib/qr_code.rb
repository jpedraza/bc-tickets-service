class QRCode
  class << self
    def as_png(code)
      png_opts = {
        :pixels_per_module => 4,
      }
      QREncoder.encode(code).png(png_opts)
    end

    def create(code, path=path_for_code(code))
      png(code).save(path) or raise "Could not create code \"#{code}\"."
      path_from_public(code)
    end

    def path_for_code(code)
      Rails.root.join 'public', 'codes', "#{code}.png"
    end
  end
end
