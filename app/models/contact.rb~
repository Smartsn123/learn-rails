class Contact < ActiveRecord::Base
 has_no_table
 attr_accessor :name, :string
 attr_accessor :email, :string
 attr_accessor :content, :string
 
 validates_presence_of :name
 validates_presence_of :email
 validates_presence_of :content
 validates_format_of :email,
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
 validates_length_of :content, :maximum => 500
 
 def  update_spreadsheet
    connection = GoogleDrive.login(ENV["GMAIL_USERNAME "],ENV["GMAIL_PASSWORD"])
    ss= connection.spreadsheet_by_title("Learn-Rails-Example")
    if ss.nil?
       ss=connection.create_spreadsheet("Learn-Rails-Example")
    end
    ws= ss.worksheet[0]
    last_row=1+ws.num_rows
    ws[last_row,1] = Time.new
    ws[last_row,2] = self.name
    ws[last_row,3] = self.email
    ws[last_row,4] = self.content
    ws.save
 end
 
 end
    

#fixing proxy problem for Ruby-URI 
#/usr/lib/ruby/2.0.0/open-uri.rb
#def OpenURI.open_http(buf, target, proxy, options) # :nodoc:
#    if proxy
#      proxy_uri, proxy_user, proxy_pass = proxy
#+     if proxy_uri.userinfo
#+       proxy_user, proxy_pass = proxy_uri.userinfo.split(':')
#+       proxy_uri = URI.parse(proxy_uri.scheme + '://' + proxy_uri.host + ':' + proxy_uri.port.to_s)
#+     end
#      raise "Non-HTTP proxy URI: #{proxy_uri}" if proxy_uri.class != URI::HTTP
#    end

