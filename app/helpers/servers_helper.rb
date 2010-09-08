module ServersHelper
  
  def display_attributes(server)
    html=""
    server.attributes.sort.each do |key, value|
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
