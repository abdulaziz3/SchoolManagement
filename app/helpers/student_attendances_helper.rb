module StudentAttendancesHelper
  # def attendance_chart_series(orders, start_time)
  #   orders_by_day = orders.where(:purchased_at => start_time.beginning_of_day..Time.zone.now.end_of_day).
  #                   group("date(purchased_at)").
  #                   select("purchased_at, sum(total_price) as total_price")
  #   (start_time.to_date..Date.today).map do |date|
  #     order = orders_by_day.detect { |order| order.purchased_at.to_date == date }
  #     order && order.total_price.to_f || 0
  #   end.inspect
  # end

  def attendance_chart_series(att_status)
    start_time = StudentAttendance.order("date asc")[0].date.to_datetime
    end_time = StudentAttendance.order("date desc")[0].date.to_datetime
    data ||= []
    attendance = StudentAttendance.joins(:attendance_description).where("att_status = ? and date between ? and ?",
      att_status,start_time.beginning_of_day,Time.zone.now.end_of_day
    ).group_by_day(:date, format: "%d-%m-%Y").count
    p att_status
    p attendance
    count = 1
    attendance.each do |attend|
      while (start_time.strftime("%d-%m-%Y").to_date < attend[0].to_date) and (count == 1) do
        data << 0
        start_time = start_time + 1.day
      end
      data << attend[1]
      count = count + 1
      if count > attendance.count
        while end_time.strftime("%d-%m-%Y").to_date > attend[0].to_date do
          data << 0
          end_time = end_time - 1.day
        end
      end
    end
    data
  end

  def attendance_chart_categories
    date ||= []
    start_time = StudentAttendance.order("date asc")[0].date.to_datetime
    end_time = StudentAttendance.order("date desc")[0].date.to_datetime
    while (start_time.strftime("%d-%m-%Y").to_date <= end_time.strftime("%d-%m-%Y").to_date) do
      date << start_time.strftime("%d-%m-%Y")
      start_time = start_time + 1.day
    end
    JSON.parse date.to_s
  end
end
