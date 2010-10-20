module ServersHelper
  
  def display_attributes(server)
    html=""
    server.attributes.sort.each do |key, value|
      next if key =~ /^_/ # don't show hidden fields
      html << %[
          <p>
            <b>#{key}:</b>
            #{value}
          </p>
        ]
    end
    html
  end
  
end
