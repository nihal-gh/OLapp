from flask import Flask, render_template

app = Flask(__name__)

# Route for home page (Orphan Link)
@app.route('/')
@app.route('/Orphanlink.html')
def home():
    return render_template('Orphanlink.html')

# Route for adoption page
@app.route('/adoption.html')
def adoption():
    return render_template('adoption.html')

# Route for donations page
@app.route('/donation-cards.html')
def donations():
    return render_template('donation-cards.html')

# Route for login page
@app.route('/login')
def login():
    return render_template('login.html')

#route for team section 
@app.route('/team-section.html')
def team_section():
    return render_template('team-section.html')


if __name__ == '__main__':
    app.run(debug=True)
