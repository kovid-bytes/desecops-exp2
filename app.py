import os
import secrets

from flask import Flask
from flask_wtf.csrf import CSRFProtect

app = Flask(__name__)
app.config["SECRET_KEY"] = os.environ.get("SECRET_KEY") or secrets.token_hex(32)

csrf = CSRFProtect(app)


@app.route("/")
def home():
    return "DevSecOps CI/CD Pipeline is Working!"


if __name__ == "__main__":
    app.run()
