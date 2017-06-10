import flask
from flask import render_template, request, json, redirect, session
from flaskext.mysql import MySQL
from wtforms import Form, StringField, PasswordField, validators
from werkzeug.security import generate_password_hash, check_password_hash

mysql = MySQL()
seek = flask.Flask(__name__)
seek.secret_key = 'a02304jire0942jitn092jf039ejinsifgj20j9ei0934runifjldkn-sdkjn'

# MySQL configurations
seek.config['MYSQL_DATABASE_USER'] = 'royce'
seek.config['MYSQL_DATABASE_PASSWORD'] = '261523'
seek.config['MYSQL_DATABASE_DB'] = 'seekdb'
seek.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(seek)

@seek.route('/')
def main():
    return render_template('index.html')

@seek.route('/registerSpeaker',methods=['POST'])
def registerSpeaker():
    getfirstname=request.form['firstname']
    getlastname = request.form['lastname']
    getusername = request.form['username']
    getpassword = request.form['password']
    getemail = request.form['email']
    getage = request.form['age']
    getjobtitle = request.form['jobtitle']
    getcontactnumber = request.form['contactnumber']
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.callproc('usp_registerSpeaker',
                    (getfirstname,getlastname,getage,getjobtitle,getcontactnumber,getemail,getusername,getpassword))
    conn.commit()
    return "<h1>Registered Speaker</h1>"

@seek.route('/registerOrg',methods=['POST'])
def registerOrg():
    getusername = request.form['username']
    getpassword = request.form['password']
    getemail = request.form['email']
    getcontact = request.form['contact']
    getorgname = request.form['orgname']
    getrep = request.form['representative']

    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.callproc('usp_registerOrg', (getorgname, getcontact, getrep, getemail, getusername, getpassword))


    return "<h1>Registered Organization</h1>"

@seek.route('/loginAccount',methods=['POST'])
def createAccount():
    if request.method=='POST':
        getusername = request.form['username']
        getpassword = request.form['password']
        print(getusername,getpassword)
        conn=mysql.connect()
        cursor=conn.cursor()
        cursor.execute("SELECT COUNT(user_username) FROM user_account WHERE user_username='{}' AND user_password='{}'"
                       .format(getusername,getpassword))
        data=cursor.fetchone()
        print(data)
        if(data[0]==1):
            session['logged_in']=True
            session['user']=getusername
            return "Success!"
        else:
            return render_template('error.html',message="The username or password does not match any record!")
        
    else:
        return abort(401)



if __name__ == '__main__':
    seek.run(debug=True)