#Funciones para sacar el día,mes y año del suceso desde el campo Case Number.

def year(string):
    dev=string[0:4]
    return int(dev)
def month(string):
    dev=string[5:7]
    return int(dev)
def day(string):
    dev=string[8:10]
    return int(dev)
