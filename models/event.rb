def create_event(company_id, event_type, event_date, venue, guests, theme, budget, image_url, notes)
    sql = "insert into events (company_id, event_type, event_date, venue, guests, theme, budget, image_url, notes) values ($1, $2, $3, $4, $5, $6, $7, $8, $9);"
    run_sql(sql, [company_id, event_type, event_date, venue, guests, theme, budget, image_url, notes])
end 

def find_all_events
    run_sql("SELECT * FROM events;")
end 

def find_one_event_by_id(id)
    events = run_sql("SELECT * FROM events WHERE id = $1;", [id])
    events.first
end

def find_all_events_by_company_id(company_id)
    sql = "SELECT * FROM events WHERE company_id = $1 ORDER BY event_date DESC;"
    run_sql(sql,[company_id])
end

def update_event(id, event_type, event_date, venue, guests, theme, budget, image_url, notes)
    sql = "update events set event_type = $1, event_date = $2, venue = $3, guests = $4, theme = $5, budget = $6, image_url = $7, notes = $8 WHERE id = $9;"
    events = run_sql(sql, [event_type, event_date, venue, guests, theme, budget, image_url, notes, id])
    events.first
end

def update_notes(id, notes) 
    sql = "update events set notes = $1 WHERE id = $2;"
    events = run_sql(sql, [notes, id])
    events.first
end

def destroy_event(id) 
    sql = "delete from events where id = $1;"
    run_sql(sql, [id])
end
