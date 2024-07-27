from flask import Flask
import logging

app = Flask(__name__)

logging.basicConfig(filename="/logs/flask.log", level=logging.DEBUG, format='%(asctime)s %(levelname)s %(message)s')

@app.route("/")
def helloworld():
    logging.info("Hello World")
    return "Hello World!"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port = 8000)