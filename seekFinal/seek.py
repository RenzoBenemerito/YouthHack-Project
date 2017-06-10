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
        # request.form['username']
        pass
    else:
        request.method(401)

if __name__ == '__main__':
    seek.run(debug=True)