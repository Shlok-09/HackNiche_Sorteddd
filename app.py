from flask import Flask, request, jsonify
import pandas as pd
import pickle
import json
import numpy as np


app = Flask(__name__)

loanmodel = pickle.load(open("loan.pkl","rb"))
insurancemodel = pickle.load(open("insurance.pkl","rb"))
policymodel = pickle.load(open("policy.pkl","rb"))
bondmodel = pickle.load(open("bond.pkl","rb"))
mfmodel = pickle.load(open("mf.pkl","rb"))
cryptomodel = pickle.load(open("crypto.pkl","rb"))
stocksmodel = pickle.load(open("stocks.pkl","rb"))

class NpEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, np.integer):
            return int(obj)
        if isinstance(obj, np.floating):
            return float(obj)
        if isinstance(obj, np.ndarray):
            return obj.tolist()
        elif isinstance(obj, np.bool_):             
            return bool(obj)
        return super(NpEncoder, self).default(obj)



@app.route('/api/predictloan', methods=['POST'])
def predictloan():
    json_ = request.json
    df = pd.DataFrame(json_)
    df['Gender'] = df['Gender'].replace('M',1)
    df['Gender'] = df['Gender'].replace('F',0)
    df['Education'] = df['Education'].replace('UG',1)
    df['Education'] = df['Education'].replace('PG',2)
    df['Education'] = df['Education'].replace('Masters',3)
    df['Education'] = df['Education'].replace('SSC',4)
    df['Education'] = df['Education'].replace('HSC',5)
    df['Education'] = df['Education'].replace('<SSC',6)
    df['Profession'] = df['Profession'].replace('Student',1)
    df['Profession'] = df['Profession'].replace('Manager',2)
    df['Profession'] = df['Profession'].replace('Fresher',3)
    df['Profession'] = df['Profession'].replace('Intern',4)
    df['Profession'] = df['Profession'].replace('CEO',5)
    df['Profession'] = df['Profession'].replace('Employee',6)
    df['Profession'] = df['Profession'].replace('Business',7)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Maritial Status'] = df['Maritial Status'].replace('Married',1)
    df['Maritial Status'] = df['Maritial Status'].replace('Single',2)
    df['Maritial Status'] = df['Maritial Status'].replace('Divorced',3)
    df['Children'] = df['Children'].replace('Yes',1)
    df['Children'] = df['Children'].replace('No',0)

    predictionloan = loanmodel.predict(df)[0]
    predictionloan = json.dumps(predictionloan, cls=NpEncoder)
    return jsonify({'Prediction': (predictionloan)})

@app.route('/api/predictinsurance', methods=['POST'])
def predictinsurance():
    json_ = request.json
    df = pd.DataFrame(json_)
    df['Gender'] = df['Gender'].replace('M',1)
    df['Gender'] = df['Gender'].replace('F',0)
    df['Education'] = df['Education'].replace('UG',1)
    df['Education'] = df['Education'].replace('PG',2)
    df['Education'] = df['Education'].replace('Masters',3)
    df['Education'] = df['Education'].replace('SSC',4)
    df['Education'] = df['Education'].replace('HSC',5)
    df['Education'] = df['Education'].replace('<SSC',6)
    df['Profession'] = df['Profession'].replace('Student',1)
    df['Profession'] = df['Profession'].replace('Manager',2)
    df['Profession'] = df['Profession'].replace('Fresher',3)
    df['Profession'] = df['Profession'].replace('Intern',4)
    df['Profession'] = df['Profession'].replace('CEO',5)
    df['Profession'] = df['Profession'].replace('Employee',6)
    df['Profession'] = df['Profession'].replace('Business',7)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Maritial Status'] = df['Maritial Status'].replace('Married',1)
    df['Maritial Status'] = df['Maritial Status'].replace('Single',2)
    df['Maritial Status'] = df['Maritial Status'].replace('Divorced',3)
    df['Children'] = df['Children'].replace('Yes',1)
    df['Children'] = df['Children'].replace('No',0)

    predictioninsurance = insurancemodel.predict(df)[0]
    predictioninsurance = json.dumps(predictioninsurance, cls=NpEncoder)
    return jsonify({'Prediction': (predictioninsurance)})

@app.route('/api/predictpolicy', methods=['POST'])
def predictpolicy():
    json_ = request.json
    df = pd.DataFrame(json_)
    df['Gender'] = df['Gender'].replace('M',1)
    df['Gender'] = df['Gender'].replace('F',0)
    df['Education'] = df['Education'].replace('UG',1)
    df['Education'] = df['Education'].replace('PG',2)
    df['Education'] = df['Education'].replace('Masters',3)
    df['Education'] = df['Education'].replace('SSC',4)
    df['Education'] = df['Education'].replace('HSC',5)
    df['Education'] = df['Education'].replace('<SSC',6)
    df['Profession'] = df['Profession'].replace('Student',1)
    df['Profession'] = df['Profession'].replace('Manager',2)
    df['Profession'] = df['Profession'].replace('Fresher',3)
    df['Profession'] = df['Profession'].replace('Intern',4)
    df['Profession'] = df['Profession'].replace('CEO',5)
    df['Profession'] = df['Profession'].replace('Employee',6)
    df['Profession'] = df['Profession'].replace('Business',7)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Maritial Status'] = df['Maritial Status'].replace('Married',1)
    df['Maritial Status'] = df['Maritial Status'].replace('Single',2)
    df['Maritial Status'] = df['Maritial Status'].replace('Divorced',3)
    df['Children'] = df['Children'].replace('Yes',1)
    df['Children'] = df['Children'].replace('No',0)

    predictionpolicy = policymodel.predict(df)[0]
    predictionpolicy = json.dumps(predictionpolicy, cls=NpEncoder)
    return jsonify({'Prediction': (predictionpolicy)})


@app.route('/api/predictbond', methods=['POST'])
def predictbond():
    json_ = request.json
    df = pd.DataFrame(json_)
    df['Gender'] = df['Gender'].replace('M',1)
    df['Gender'] = df['Gender'].replace('F',0)
    df['Education'] = df['Education'].replace('UG',1)
    df['Education'] = df['Education'].replace('PG',2)
    df['Education'] = df['Education'].replace('Masters',3)
    df['Education'] = df['Education'].replace('SSC',4)
    df['Education'] = df['Education'].replace('HSC',5)
    df['Education'] = df['Education'].replace('<SSC',6)
    df['Profession'] = df['Profession'].replace('Student',1)
    df['Profession'] = df['Profession'].replace('Manager',2)
    df['Profession'] = df['Profession'].replace('Fresher',3)
    df['Profession'] = df['Profession'].replace('Intern',4)
    df['Profession'] = df['Profession'].replace('CEO',5)
    df['Profession'] = df['Profession'].replace('Employee',6)
    df['Profession'] = df['Profession'].replace('Business',7)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Maritial Status'] = df['Maritial Status'].replace('Married',1)
    df['Maritial Status'] = df['Maritial Status'].replace('Single',2)
    df['Maritial Status'] = df['Maritial Status'].replace('Divorced',3)
    df['Children'] = df['Children'].replace('Yes',1)
    df['Children'] = df['Children'].replace('No',0)

    predictionbond = bondmodel.predict(df)[0]
    predictionbond = json.dumps(predictionbond, cls=NpEncoder)
    return jsonify({'Prediction': (predictionbond)})


@app.route('/api/predictmf', methods=['POST'])
def predictmf():
    json_ = request.json
    df = pd.DataFrame(json_)
    df['Gender'] = df['Gender'].replace('M',1)
    df['Gender'] = df['Gender'].replace('F',0)
    df['Education'] = df['Education'].replace('UG',1)
    df['Education'] = df['Education'].replace('PG',2)
    df['Education'] = df['Education'].replace('Masters',3)
    df['Education'] = df['Education'].replace('SSC',4)
    df['Education'] = df['Education'].replace('HSC',5)
    df['Education'] = df['Education'].replace('<SSC',6)
    df['Profession'] = df['Profession'].replace('Student',1)
    df['Profession'] = df['Profession'].replace('Manager',2)
    df['Profession'] = df['Profession'].replace('Fresher',3)
    df['Profession'] = df['Profession'].replace('Intern',4)
    df['Profession'] = df['Profession'].replace('CEO',5)
    df['Profession'] = df['Profession'].replace('Employee',6)
    df['Profession'] = df['Profession'].replace('Business',7)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Maritial Status'] = df['Maritial Status'].replace('Married',1)
    df['Maritial Status'] = df['Maritial Status'].replace('Single',2)
    df['Maritial Status'] = df['Maritial Status'].replace('Divorced',3)
    df['Children'] = df['Children'].replace('Yes',1)
    df['Children'] = df['Children'].replace('No',0)

    predictionmf = mfmodel.predict(df)[0]
    predictionmf = json.dumps(predictionmf, cls=NpEncoder)
    return jsonify({'Prediction': (predictionmf)})


@app.route('/api/predictcrypto', methods=['POST'])
def predictcrypto():
    json_ = request.json
    df = pd.DataFrame(json_)
    df['Gender'] = df['Gender'].replace('M',1)
    df['Gender'] = df['Gender'].replace('F',0)
    df['Education'] = df['Education'].replace('UG',1)
    df['Education'] = df['Education'].replace('PG',2)
    df['Education'] = df['Education'].replace('Masters',3)
    df['Education'] = df['Education'].replace('SSC',4)
    df['Education'] = df['Education'].replace('HSC',5)
    df['Education'] = df['Education'].replace('<SSC',6)
    df['Profession'] = df['Profession'].replace('Student',1)
    df['Profession'] = df['Profession'].replace('Manager',2)
    df['Profession'] = df['Profession'].replace('Fresher',3)
    df['Profession'] = df['Profession'].replace('Intern',4)
    df['Profession'] = df['Profession'].replace('CEO',5)
    df['Profession'] = df['Profession'].replace('Employee',6)
    df['Profession'] = df['Profession'].replace('Business',7)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Maritial Status'] = df['Maritial Status'].replace('Married',1)
    df['Maritial Status'] = df['Maritial Status'].replace('Single',2)
    df['Maritial Status'] = df['Maritial Status'].replace('Divorced',3)
    df['Children'] = df['Children'].replace('Yes',1)
    df['Children'] = df['Children'].replace('No',0)

    predictioncrypto = cryptomodel.predict(df)[0]
    predictioncrypto = json.dumps(predictioncrypto, cls=NpEncoder)
    return jsonify({'Prediction': (predictioncrypto)})


@app.route('/api/predictstocks', methods=['POST'])
def predictstocks():
    json_ = request.json
    df = pd.DataFrame(json_)
    df['Gender'] = df['Gender'].replace('M',1)
    df['Gender'] = df['Gender'].replace('F',0)
    df['Education'] = df['Education'].replace('UG',1)
    df['Education'] = df['Education'].replace('PG',2)
    df['Education'] = df['Education'].replace('Masters',3)
    df['Education'] = df['Education'].replace('SSC',4)
    df['Education'] = df['Education'].replace('HSC',5)
    df['Education'] = df['Education'].replace('<SSC',6)
    df['Profession'] = df['Profession'].replace('Student',1)
    df['Profession'] = df['Profession'].replace('Manager',2)
    df['Profession'] = df['Profession'].replace('Fresher',3)
    df['Profession'] = df['Profession'].replace('Intern',4)
    df['Profession'] = df['Profession'].replace('CEO',5)
    df['Profession'] = df['Profession'].replace('Employee',6)
    df['Profession'] = df['Profession'].replace('Business',7)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Profession'] = df['Profession'].replace('Retired',8)
    df['Maritial Status'] = df['Maritial Status'].replace('Married',1)
    df['Maritial Status'] = df['Maritial Status'].replace('Single',2)
    df['Maritial Status'] = df['Maritial Status'].replace('Divorced',3)
    df['Children'] = df['Children'].replace('Yes',1)
    df['Children'] = df['Children'].replace('No',0)

    predictionstocks = stocksmodel.predict(df)[0]
    predictionstocks = json.dumps(predictionstocks, cls=NpEncoder)
    return jsonify({'Prediction': (predictionstocks)})



if __name__ == "__main__":
    app.run(debug=True)