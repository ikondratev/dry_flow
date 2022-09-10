module Kafka
  class App
    Karafka::App.routes.draw do
      topic "add_toy_to_tester" do
        consumer Container["kafka.consumers.toy_testing"]
      end
    end
  end
end
