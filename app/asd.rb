require 'date'

date1 = Date.parse("18/06/2022")
date2 = Date.parse("2/07/2022")

p "Period #{date1.strftime("%d/%m/%Y")} to #{date2.strftime("%d/%m/%Y")}"

(date1..date2).each do |date|
  p date.strftime("%d/%m/%Y")
end