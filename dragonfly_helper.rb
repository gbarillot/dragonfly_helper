module DragonflyHelper

  # Cache Dragonfly thumbnail generation and produce friendly SEO URLs
  def thumbnail_tag(image, size, options={})

    image ? this_image = image : this_image = $conf.default_avatar

    if options.has_key?(:path)
      sub_dir = options[:path]
      options.delete(:path)
    else
      sub_dir = 'images'
    end

    path     = File.join('/', sub_dir, size, this_image.name)
    resource = File.join(Rails.root, 'public', path)

    unless File.exists?(resource)
      this_image.thumb(size).to_file(resource)
    end 

    attrs = ''
    options.each do |key, value| 
      if key == :data        
        value.each do |key, value|
          attrs << "data-#{key.to_s}='#{value.to_s}' "
        end
      else
        attrs << "#{key.to_s}='#{value.to_s}' "
      end
    end

    attrs << "alt='#{File.basename(this_image.name, '.*')}'" if options[:alt].blank? 

    # Optionnal stuff : since resize params can be very tricky (ex: '400x300+50+100'), 
    # make sure they are in simple 'widthxheight' format to pick up width/height params
    # If not, just forget it and leave the browser deal with image dimensions
    width, height = ''
    if(size.split('x')[0].to_i.to_s == size.split('x')[0] && size.split('x')[1].to_i.to_s == size.split('x')[1])
      width  = "width='#{size.split('x')[0].to_i}px'" 
      height = "height='#{size.split('x')[1].to_i}px'" 
    end

    "<img src='#{path}' #{width} #{height} #{attrs} />".html_safe
  end

end