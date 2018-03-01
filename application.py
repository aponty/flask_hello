from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

# EB looks for an 'application' callable by default.
application = Flask(__name__)

if __name__ == "__main__":
    # Setting debug to True enables debug output. This line should be
    # removed before deploying a production app.
     application.run(debug=True,host='0.0.0.0')
