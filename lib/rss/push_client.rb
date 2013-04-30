module RSS
  class PushClient

  	attr_accessor :endpoint

  	def initialize(endpoint)
  	  @endpoint = endpoint
  	  @httpclient = HTTPClient.new
  	end

  	def send_broadcast(api_key, title, message, uri)
      @httpclient.post @endpoint, 
      				   :body => construct_body(api_key, title, message, uri) do |response|

        return response
      end
  	end

  	private
  	  def construct_body(api_key, title, message, uri)
        """
        <soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.androidpn.org/\">
  		    <soapenv:Header/>
    		    <soapenv:Body>
    		      <web:sendBroadcast>
    		         <apiKey>#{api_key}</apiKey>
    		         <title>#{title}</title>
    		         <message>#{message}</message>
    		         <uri>#{uri}</uri>
    		      </web:sendBroadcast>
    		    </soapenv:Body>
		    </soapenv:Envelope>
		    """
  	  end
  end
end