from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    print("Service A was called!")
    return "Hello from Service A!"

if __name__ == '__main__':
    app.run(host='0.0.0.0')