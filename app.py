from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    return "DevOps Demo App"


@app.route("/health")
def health():
    return jsonify(status="healthy")


@app.route("/info")
def info():
    return jsonify(version="1.0.0", environment="development")


@app.route("/version")
def version():
    return jsonify(version="1.0.0", application="DevOps Demo")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)