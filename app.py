from flask import Flask, render_template, request, redirect, session, url_for, flash
from flask_mysqldb import MySQL

app = Flask(__name__)

# MySQL configuration
app.config['MYSQL_HOST'] = 'localhost'  # your MySQL host
app.config['MYSQL_USER'] = 'root'  # your MySQL username
app.config['MYSQL_PASSWORD'] = 'root'  # your MySQL password
app.config['MYSQL_DB'] = 'flask_db'  # your MySQL database name
mysql = MySQL(app)

# Set a secret key for session management (required for flashing messages)
app.secret_key = 'nihal'  # Change this to a strong secret key in production your_secret_key

# Route for home page (Orphan Link)
@app.route('/')
@app.route('/Orphanlink.html')
def home():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM donations")  # Ensure this query is correct
    donations = cur.fetchall()
    cur.close()
    donations_list = [{'image_url': d[0], 'name': d[1], 'details': d[2], 'urgency': d[3]} for d in donations]

    return render_template('Orphanlink.html', donations=donations)

# Route for adoption page
@app.route('/adoption.html')
def adoption():
    return render_template('adoption.html')

# Orphanages page
@app.route('/orphanages.html')
def orphanages():
    return render_template('orphanages.html')


#specific donation
@app.route('/specdono.html')
def specdono():
    return render_template('specdono.html')

# Route for donations page (fetch data from MySQL)
@app.route('/donations.html')
@app.route('/donation-cards.html')
def donations():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM donations")
    data = cur.fetchall()
    cur.close()
    
    # Process data into a list of dictionaries
    donations_list = []
    for row in data:
        donations_list.append({
            'id': row[0],
            'name': row[1],
            'details': row[2],
            'urgency': row[3],
            'request_date': row[4],
            'image_url': row[5]
        })
    
    return render_template('donation-cards.html', donations=donations_list)

# Route for login page
@app.route('/login.html')
def login():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login_user():
    username = request.form['username']
    password = request.form['password']

    if username == 'admin' and password == 'admin':
        session['logged_in'] = True  # Set a session variable for login status
        return redirect(url_for('dashboard'))  # Redirect to the dashboard
    else:
        flash('Invalid credentials, please try again.')  # Flash a message for invalid login
        return redirect(url_for('login'))
    
@app.route('/dashboard')
def dashboard():
    # Get the cursor from the mysql connection
    cursor = mysql.connection.cursor()

    # Execute the query to get donor data
    cursor.execute('SELECT name, email, amount, purpose FROM donators ORDER BY date DESC LIMIT 10')
    donors = cursor.fetchall()  # Fetch all the rows from the executed query
    
    # Execute the query to get the recent 10 adoption applications
    cursor.execute('SELECT full_name, email, child_age, submitted_at FROM adoption_applications ORDER BY submitted_at DESC LIMIT 10')
    applications = cursor.fetchall()

    # Close the cursor
    cursor.close()

    # Pass the donors and applications data to the template
    return render_template('dashboard.html', donors=donors, applications=applications)

# Route for handling specific donations form submission
@app.route('/submit-specific-donation', methods=['POST'])
def submit_specific_donation():
    # Retrieve form data
    full_name = request.form['fullName']
    email = request.form['email']
    phone = request.form.get('phone')
    donation_type = request.form['donationType']
    
    # Initialize other fields based on donation type
    food_type = request.form.get('foodType') if donation_type == 'food' else None
    food_quantity = request.form.get('foodQuantity') if donation_type == 'food' else None
    expiry_date = request.form.get('expiryDate') if donation_type == 'food' else None
    clothing_type = request.form.get('clothingType') if donation_type == 'clothes' else None
    clothing_size = request.form.get('clothingSize') if donation_type == 'clothes' else None
    clothing_quantity = request.form.get('clothingQuantity') if donation_type == 'clothes' else None
    other_type = request.form.get('otherType') if donation_type == 'other' else None
    
    pickup_method = request.form['pickupMethod']
    pickup_days = request.form.get('pickupDays')
    comments = request.form.get('comments')
    consent = request.form.get('consent') is not None

    # Insert into the specific_donations table
    cur = mysql.connection.cursor()
    cur.execute("""
        INSERT INTO specific_donations (
            full_name, email, phone, donation_type, food_type, 
            food_quantity, expiry_date, clothing_type, clothing_size, 
            clothing_quantity, other_type, pickup_method, 
            pickup_days, comments, consent
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """, (full_name, email, phone, donation_type, food_type, 
          food_quantity, expiry_date, clothing_type, clothing_size, 
          clothing_quantity, other_type, pickup_method, 
          pickup_days, comments, consent))
    
    mysql.connection.commit()  # Commit the transaction
    cur.close()  # Close the cursor

    flash('Thank you for your specific donation!', 'success')  # Flash success message
    return redirect(url_for('donations'))  # Redirect to the donations page


# Route for team section 
@app.route('/donate.html')
def donate():
    return render_template('donate.html')


# Route for team section 
@app.route('/team-section.html')
def team_section():
    return render_template('team-section.html')

# About Us page
@app.route('/aboutus.html')
def aboutus():
    return render_template('aboutus.html')

#donations analysis 
@app.route('/donation_stats')
def donation_stats():
    cursor = mysql.connection.cursor()
    
    # Query to get total number of people who donated
    cursor.execute("SELECT COUNT(DISTINCT email) FROM donators")
    total_people = cursor.fetchone()[0]
    
    # Query to get the total amount donated
    cursor.execute("SELECT SUM(amount) FROM donators")
    total_donated = cursor.fetchone()[0] or 0  # Handle null sums
    
    cursor.close()
    
    return {'total_people': total_people, 'total_donated': total_donated}


#donations
@app.route('/payment')
def payment():
    amount = request.args.get('amount')
    purpose = request.args.get('purpose')
    return render_template('payment.html', amount=amount, purpose=purpose)

@app.route('/process_payment', methods=['POST'])
def process_payment():
    name = request.form['name']
    email = request.form['email']  # Retrieve the email from the form
    amount = request.form['amount']  # Retrieve the amount from the form
    purpose = request.form['purpose']  # Retrieve the purpose from the form
    
    cursor = mysql.connection.cursor()

    # Update the SQL query to insert into the 'donators' table
    query = "INSERT INTO donators (name, email, amount, purpose) VALUES (%s, %s, %s, %s)"
    values = (name, email, amount, purpose)
    
    # Execute the query and commit the transaction
    cursor.execute(query, values)
    mysql.connection.commit()  # Ensure this matches the MySQL connection object
    cursor.close()  # Close the cursor after executing the query

    return "Thank you for your donation!"


# Route for handling the adoption form submission
@app.route('/submit_adoption', methods=['POST'])
def submit_adoption():
    if request.method == 'POST':
        # Retrieve form data
        full_name = request.form['full_name']
        email = request.form['email']
        phone = request.form['phone']
        address = request.form['address']
        dob = request.form['dob']
        gender = request.form['gender']
        child_age = request.form['child_age']
        reason = request.form['reason']
        additional_info = request.form['additional_info']
        
        # Initialize file variable
        file = None
        file_path = ''
        
        # Handle file upload (optional)
        if 'fileupload' in request.files:  # Check if 'fileupload' key exists
            file = request.files['fileupload']
            if file:
                file_path = f'static/uploads/{file.filename}'  # Define the path where the file will be saved
                file.save(file_path)  # Save the file in a folder

        # Insert into the database
        cur = mysql.connection.cursor()
        cur.execute("""
            INSERT INTO adoption_applications (full_name, email, phone, address, date_of_birth, gender, child_age, reason, additional_info, file_path)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (full_name, email, phone, address, dob, gender, child_age, reason, additional_info, file.filename if file else None))
        
        mysql.connection.commit()
        cur.close()

        flash('Application submitted successfully!', 'success')
        return redirect(url_for('adoption'))  # Redirect to the adoption page or home page


if __name__ == '__main__':
    app.run(debug=True)
