import logging
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    app.logger.info("Service A was called!")
    print("Service A was called!")
    return "Hello from Service A!"

if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    app.run(host='0.0.0.0')