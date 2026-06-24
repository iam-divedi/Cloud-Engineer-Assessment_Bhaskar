from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <h1>Cloud Engineer Assessment</h1>
    <p>Successfully deployed on AWS using Terraform and GitHub Actions.</p>
    <p>Submitted by: <strong>Bhaskar Divedi</strong></p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
bash: line 1: Excute: command not found


