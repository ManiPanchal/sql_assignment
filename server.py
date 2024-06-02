from flask import Flask, request, jsonify,render_template
from flask_cors import CORS,cross_origin
import mysql.connector
mysql=mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="survey_data"
)
cursor=mysql.cursor()
app = Flask(__name__)
@app.route('/')
def index():
    return render_template('index.html')
@app.route('/fetchfirst',methods=['POST'])
def fetchfirst():
    # data=request.get_json()
    # print(data)
    # id=data.get('id')
    sql='select * from question join opt_ion on question.q_id=opt_ion.q_id where question.q_id=1'
    # val=(id,)
    try:
        cursor.execute(sql)
        cols = [x[0] for x in cursor.description]
        data=cursor.fetchall()
        # print(data)
        res = [dict(zip(cols,row)) for row in data]
        if data:
            return jsonify(res),200
        else:
            return jsonify({'msg':'error while'}),304
    except Exception as e:
        print(repr(e))
        return jsonify({'err':repr(e)}),500
@app.route('/fetchnext',methods=['POST'])
def fetchnext():
    data=request.get_json()
    # print(data)
    q_id=data.get('q_id')
    opt_id=data.get('opt_id')
    # print(q_id,opt_id)
    sql='select * from question join opt_ion on question.q_id=opt_ion.q_id where question.q_id=(select next_ques from relation where q_id=%s AND opt_id=%s)'
    val=(q_id,opt_id)
    try:
        cursor.execute(sql,val)
        cols = [x[0] for x in cursor.description]
        data=cursor.fetchall()
        # print(data)
        res = [dict(zip(cols,row)) for row in data]
        if data:
            return jsonify(res),200
        else:
            return jsonify({'msg':'error while'}),304
    except Exception as e:
        # print(repr(e))
        return jsonify({'err':repr(e)}),500
@app.route('/response',methods=['POST'])
def response():
    data=request.get_json()
    # print(data)
    data = data['data']
    # print(data)
    # gender,category,cloth,color,size,user_id = data_list
    gender=data[0]
    category=data[1]
    cloth=data[2]
    color=data[3]
    size=data[4]
    user_id=data[5]
    # print(q_id,opt_id)
    # print(gender,category,cloth,color,size,user_id)
    sql='insert into response values(%s,%s,%s,%s,%s,%s)'
    val=(user_id,gender,category,cloth,color,size)
    try:
        cursor.execute(sql,val)
        mysql.commit()  # Commit the transaction after insertion
        
        # Check if the row is inserted successfully
        if cursor.rowcount > 0:
            return jsonify({'msg': 'Inserted successfully'}), 200
        else:
            return jsonify({'msg': 'No rows inserted'}), 304
        # cols = [x[0] for x in cursor.description]
        # data=cursor.fetchall()
        # print(data)
        # res = [dict(zip(cols,row)) for row in data]
        # if data:
        #     return jsonify({'meg':'inserted'}),200
        # else:
        #     return jsonify({'msg':'error while'}),304
    except Exception as e:
        # print(repr(e))
        return jsonify({'err':repr(e)}),500

app.run(debug=True)
