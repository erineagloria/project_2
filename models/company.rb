require "bcrypt"

def run_sql(sql, arr = [])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'theloop'})
    results = db.exec(sql, arr)
    db.close
    results
end

def create_company(company, main_contact, email, password)
    password_digest = BCrypt::Password.create(password)
    sql = "insert into companies (company, main_contact, email, password_digest) values ($1, $2, $3, $4);"
    run_sql(sql, [company, main_contact, email, password])
end

def find_one_company_by_name(company)
    sql = "SELECT * FROM companies WHERE company = $1;"
    companies = run_sql(sql, [company])
    return companies.first
end

def find_one_company_by_company_id(company_id)
    companies = run_sql("SELECT * FROM companies WHERE company_id = $1;", [company_id])
    return companies.first
end
