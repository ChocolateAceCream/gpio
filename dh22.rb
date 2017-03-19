require "dht-sensor-ffi"
require 'json'
require 'uri'
base_url = 'http://34.200.149.58:3003'
get_url = base_url+"/authenticate"
p get_url
email = 'admin@mail.com'
password = '123qweasd'
a = `curl -H "Content-Type: application/json" -X POST -d '{"email": "#{email}","password": "#{password}"}' #{get_url}`
value = JSON.parse(a)
token = value['auth_token']
p token
post_url = base_url + "/dhts"
post_content = Hash.new
while true do
val = DhtSensor.read(4,22)
temperature = val.temp.round(3)
humidity = val.humidity.round(3)
puts "Temperature is #{temperature} C"
puts "Humidity is #{humidity} %"
post_content["name"] = "home"
post_content["temperature"]=temperature
post_content["humidity"]=humidity
content = JSON.generate(post_content)
p content
a = `curl -H "Content-Type: application/json" -H "Authorization: #{token}" -X POST -d '#{content}' #{post_url}`
p a
sleep 5
end
