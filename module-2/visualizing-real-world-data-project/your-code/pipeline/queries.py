# Este archivo declara un argparse para que el usuario elija una opción.

import argparse

def getQuery():
    parser = argparse.ArgumentParser(description='Introduce los datos por los que quieras realizar la búsqueda de ubicación')

    parser.add_argument('-type', '-t', dest='el1', default="games_video", type=str,
    help='Tipo de compañía. games_video por defecto')

    parser.add_argument('-e', '-employees', dest='el2', default=87, type=str,
    help="Número de empleados que tendrá tu compañía. El buscador localiza empresas de igual o mayor tamaño. 87 por defecto")

    parser.add_argument('-y', '-year', dest='el3', default=2009, type=str,
    help="Búsqueda de empresas cercanas desde este año. 2009 por defecto")

    parser.add_argument('-m', '-money', dest='el4', default=1000000, type=str,
    help="Busca empresas cercanas que como mínimo hayan obtenido este dinero en rondas de financiación. Valor en dólares. 1.000.000 por defecto")

    type_company = parser.parse_args().el1
    employees = int(parser.parse_args().el2)
    year = int(parser.parse_args().el3)
    money = int(parser.parse_args().el4)


    if not type_company == "games_video" :
        raise ValueError("Introduce un valor válido. Por ahora solo está disponible las empresas de tipo games_video.")

    if year < 2000 or year > 2019:
        raise ValueError("Introduce un valor válido. Sólo válidos valores entre 2000 y 2019.")
    
    if employees < 10 or employees > 300:
        raise ValueError("Introduce un valor válido. Sólo válidos valores entre 10 y 300.")
    
    if money < 500000 or money > 5000000:
        raise ValueError("Introduce un valor válido. Sólo válidos valores entre 300.000 y 5.000.000.")


    dic = {
        "type" : type_company,
        "year" : year,
        "employees" : employees,
        "money" : money,
    }
    return dic