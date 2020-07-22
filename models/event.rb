def create_event(company_id, event_type, event_date, venue, guests, theme, budget, image_url)
    sql = "insert into events (company_id, event_type, event_date, venue, guests, theme, budget, image_url) values (#{company_id}, '#{event_type}', '#{event_date}', '#{venue}', #{guests}, '#{theme}', #{budget}, '#{image_url}');"
    run_sql(sql)
end 

def find_all_events
    run_sql("SELECT * FROM events;")
end 

def find_one_event_by_id(id)
    events = run_sql("SELECT * FROM events where id = #{id};")
    events.first
end
