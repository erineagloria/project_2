def create_event(company_id, event_type, event_date, venue, guests, theme, budget, image_url, notes)
    sql = "insert into events (company_id, event_type, event_date, venue, guests, theme, budget, image_url, notes) values (#{company_id}, '#{event_type}', '#{event_date}', '#{venue}', #{guests}, '#{theme}', #{budget}, '#{image_url}', '#{notes}');"
    run_sql(sql)
end 

def find_all_events
    run_sql("SELECT * FROM events;")
end 

def find_one_event_by_id(id)
    events = run_sql("SELECT * FROM events WHERE id = #{id};")
    events.first
end

def find_all_events_by_company_id(company_id)
    sql = "SELECT * FROM events WHERE company_id = #{company_id} ORDER BY event_date DESC;"
    run_sql(sql)
end

def update_event(id, event_type, event_date, venue, guests, theme, budget, image_url, notes)
    sql = "update events set event_type = '#{event_type}', event_date = '#{event_date}', venue = '#{venue}', guests = #{guests}, theme = '#{theme}', budget = #{budget}, image_url = '#{image_url}', notes = '#{notes}' WHERE id = #{id};"
    events = run_sql(sql)
    events.first
end

def update_notes(id, notes)
    sql = "update events set notes = '#{notes}' WHERE id = #{id};"
    events = run_sql(sql)
    events.first
end
