require "bcrypt"

def run_sql(sql)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'theloop'})
    results = db.exec(sql)
    db.close
    results
end

def create_company(company, main_contact, email, password)
    password_digest = BCrypt::Password.create(password)
    sql = "insert into companies (company, main_contact, email, password_digest) values ('#{company}', '#{main_contact}', '#{email}', '#{password_digest}');"
    run_sql(sql)
end

def find_one_company_by_name(company)
    sql = "SELECT * FROM companies WHERE company = '#{company}';"
    companies = run_sql(sql)
    return companies.first
end

def find_one_company_by_company_id(company_id)
    companies = run_sql("SELECT * FROM companies WHERE company_id = #{company_id};")
    return companies.first
end
