import flask
from flask import render_template, request, json, redirect, session
#from flask.ext.mysql import MySQL
from flaskext.mysql import MySQL
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

@seek.route('/register')
def register():
    return render_template('')

@seek.route('/createAccount',methods=['POST'])
def createAccount():
    if request.method=='POST':
        getusername = request.form['username']
        getpassword = request.form['password']
        conn=mysql.connect()
        cursor=conn.cursor()
        cursor.execute("SELECT COUNT(user_username) FROM user_account WHERE user_username='{}' AND user_password='{}'"
                       .format(getusername,getpassword))
        data=cursor.fetchone()
        print(data)
        if(data==1):
            session['user']=getusername
            return redirect("/")
        else:
            return "<h1>Login failed!</h1>"
        
    else:
        return abort(401)

if __name__ == '__main__':
    seek.run(debug=True)