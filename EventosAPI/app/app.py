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
    except Exception as e:
        print("SQL Error. Failed executing next query: "+str(e))
        return None
    finally:
        cursor.close()
        conn.close()

    return result


def start():
    config = GlobalConfiguration()
    flaskapp.config['MYSQL_DATABASE_USER'] = config.DATABASE_USER
    flaskapp.config['MYSQL_DATABASE_PASSWORD'] = config.DATABASE_PASSWD
    flaskapp.config['MYSQL_DATABASE_DB'] = config.DATABASE_NAME
    flaskapp.config['MYSQL_DATABASE_HOST'] = config.DATABASE_HOST
    mysql.init_app(flaskapp)

    print("Initializing application!")
    flaskapp.run()

@flaskapp.route('/funciones/precio/<num_asiento>/<seccion>/<folio>/<fecha>/<hora>')
def price_by_num_asiento(num_asiento,seccion, folio, fecha, hora):
    funcionesResult = executeQuery('''SELECT precio FROM asiento WHERE num_asiento = {}'''.format(num_asiento),''' and folio = {}'''.format(folio),''' and fecha = {}'''.format(fecha),''' and hora = {}'''.format(hora),''' and seccion = {}'''.format(seccion))
    print(funcionesResult)
    funciones = []
    funciones.append(buildPriceReponse(funcionesResult))
    return jsonify(funciones)

def buildPriceReponse(precio):
    return {
        'precio': precio
    }

@flaskapp.route('/funciones/asientos-ocupados-por-seccion/<seccion>/<folio>/<fecha>/<hora>')
def reserved_seats_by_section(seccion, folio, fecha, hora):
    funcionesResult = executeQuery('''SELECT * FROM asiento_titular WHERE seccion = {}'''.format(seccion),''' and folio = {}'''.format(folio),''' and fecha = {}'''.format(fecha),''' and hora = {}'''.format(hora))
    print(funcionesResult)
    funciones = []
    for func in funcionesResult:
        funciones.append(buildSeatsReponse(func))
    return jsonify(funciones)

def buildSeatsReponse(seat):
    return {
        'num_asiento': seat[0],
        'seccion': seat[1],
        'folio': seat[2],
        'fecha': int(time.mktime(seat[3].timetuple()))*1000,
        'hora': seat[4]
    }

@flaskapp.route('/funciones/asientos-reservados-por-titular/<no_tarjeta>')
def seats_by_titular(no_tarjeta):
    funcionesResult = executeQuery('''SELECT * FROM asiento_titular WHERE fecha >= curdate() and no_tarjeta = {}'''.format(no_tarjeta))
    print(funcionesResult)
    funciones = []
    for func in funcionesResult:
        funciones.append(buildSeatsReponse(func))
    return jsonify(funciones)

@flaskapp.route('/funciones/all-seats/<seccion>/<folio>/<fecha>/<hora>')
def all_seats_by_section(seccion, folio, fecha, hora):
    funcionesResult = executeQuery('''SELECT * FROM asiento WHERE seccion = {}'''.format(seccion),''' and folio = {}'''.format(folio),''' and fecha = {}'''.format(fecha),''' and hora = {}'''.format(hora))
    print(funcionesResult)
    funciones = []
    for func in funcionesResult:
        funciones.append(buildSeatsReponse(func))
    return jsonify(funciones)

@flaskapp.route('/funciones/datos_eventos/<folio>')
def events_data(folio):
    funcionesResult = executeQuery('''SELECT * FROM evento WHERE folio = {}'''.format(folio))
    print(funcionesResult)
    funciones = []
    funciones.append(buildEventsReponse(funcionesResult))
    return jsonify(funciones)

def buildEventsReponse(events):
    return {
        'folio': events[0],
        'nombre': events[1],
        'artistas': events[2],
        'descripcion': events[3]
    }









        
