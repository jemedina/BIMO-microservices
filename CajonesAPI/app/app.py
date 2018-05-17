from app.config import GlobalConfiguration
from flask import Flask, jsonify
from flaskext.mysql import MySQL
import time

flaskapp = Flask(__name__)
mysql = MySQL()

''' routes '''

def executeQuery(sql):
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute(sql)
        result = cursor.fetchall()
        conn.commit()
    except Exception as e:
        print("SQL Error. Failed executing next query: "+str(e))
        return None
    finally:
        cursor.close()
        conn.close()

    return result

def buildCajonReponse(caj):
    return {
        'num_cajon': caj[0],
        'folio': caj[1],
        'fecha': int(time.mktime(caj[2].timetuple()))*1000,
        'hora': str(caj[3]),
        'no_tarjeta': caj[4]
    }

@flaskapp.route('/cajones/cajones-ocupados/<folio>/<fecha>/<hora>')
def cajones_ocupados(folio, fecha, hora):
    sql_sent = '''SELECT * FROM estacionamiento WHERE folio = {}'''.format(folio)+''' and fecha = "{}"'''.format(fecha)+''' and hora = "{}"'''.format(hora)
    cajonesResult = executeQuery(sql_sent)
    print(sql_sent)
    cajones = []
    for caj in cajonesResult:
        cajones.append(buildCajonReponse(caj))
    return jsonify(cajones)
    
    
@flaskapp.route('/cajones/cajones-titular/<titular>')    
def cajones_por_titular(titular):
    cajonesResult = executeQuery('''SELECT * FROM estacionamiento WHERE no_tarjeta = {}'''.format(titular))
    print(cajonesResult)
    cajones = []
    for caj in cajonesResult:
        cajones.append(buildCajonReponse(caj))
    print("JSON: ",cajones)
    return jsonify(cajones)
    
@flaskapp.route('/cajones/add/<num_cajon>/<folio>/<fecha>/<hora>/<no_tarjeta>')
def promo_add_titular(num_cajon, folio, fecha, hora, no_tarjeta):
    query_str = '''INSERT INTO estacionamiento VALUES({}, {}, "{}", "{}", "{}")'''.format(num_cajon,folio,fecha,hora,no_tarjeta)
    sql_query = query_str
    print("SQL",query_str)
    result = executeQuery(sql_query)
    if result != None:
        return "Ok"
    else:
        return "Error"    
    
def start():
    config = GlobalConfiguration()
    flaskapp.config['MYSQL_DATABASE_USER'] = config.DATABASE_USER
    flaskapp.config['MYSQL_DATABASE_PASSWORD'] = config.DATABASE_PASSWD
    flaskapp.config['MYSQL_DATABASE_DB'] = config.DATABASE_NAME
    flaskapp.config['MYSQL_DATABASE_HOST'] = config.DATABASE_HOST
    mysql.init_app(flaskapp)

    print("Initializing application!")
    flaskapp.run(host='0.0.0.0',port=5002)
 
 
 
 
 
 
    
    
