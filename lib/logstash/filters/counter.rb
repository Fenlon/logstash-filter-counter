# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

# This example filter will replace the contents of the default 
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an example.
class LogStash::Filters::Counter < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #   example {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "counter"
  
  # Replace the message with this value.
  config :message, :validate => :string, :default => "Hello World!"
  config :meter, :validate => :array,:default => []
  config :cycle, :validate => :number,:default => 60
  

  public
  def register
    # Add instance variables 
  end # def register

  public
  def filter(event)

    if @message
      # Replace the event message with our message as configured in the
      # config file.
      time = event["time"].strftime("%Y-%m-%d %H:%M:%S")
      event["time"]= time
    end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Example
