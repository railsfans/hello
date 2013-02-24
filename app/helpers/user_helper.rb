#encoding: utf-8
module UserHelper
def Calculate(time)
a=time/60
b=time%60
c=a.to_s+"分"+b.to_s+"秒"
return c
end
def chengjis_chart_series(products, startTime, endTime)
products_by_day=products.where(:created_at=>startTime.to_date.beginning_of_day..endTime.to_date.end_of_day).group("date(created_at)").select("created_at, sum(distance) as total_distance")
(startTime.to_date..endTime.to_date).map do |date|
product= products_by_day.detect { |product| product.created_at.to_date == date }
product && product.total_distance.to_f || 0
end.inspect
end
end
