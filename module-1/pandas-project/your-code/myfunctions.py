import pandas as pd
import re
import statistics as st

def quitarDuplicados(fdf, col, regex):
    aux_fdf = fdf.copy()
    for e in fdf[col].fillna("Unknown"):
        if re.search(regex, e):
            r = re.findall(regex, e)
            for i in r[0]:
                aux_fdf = pd.concat([aux_fdf.copy(), aux_fdf[aux_fdf[col]==e].copy()], ignore_index = True).copy()
                aux_fdf[col][aux_fdf.index.max()] = i
            aux_fdf = aux_fdf[aux_fdf[col]!=e].copy()
    return aux_fdf.copy()

def create_sizes(spe):
    tmn_i = re.findall("\d+''|\d+\"", spe)
    tmn_oi = re.findall("[\d\.]+(?='')|[\d\.]+(?= '')|[\d\.]+(?=\")|[\d\.]+(?= \")", spe)
    tmn_f = re.findall("[\d\.]+'(?=[^'])|[\d\.]+'$", spe)
    tmn_of = re.findall("[\d\.]+(?=['][^'])", spe)
    tmn_m = re.findall("\d+[\.]?[\d]?[\d]?(?= m)|\d+[\.]?[\d]?[\d]?(?=m)", spe)
    tmn_om = re.findall("\d+[\.]?[\d]?[\d]?(?= m)|\d+[\.]?[\d]?[\d]?(?=m)", spe)
    tmn_cm = re.findall("[\d\.]+cm|[\d\.]+ cm", spe)
    tmn_ocm = re.findall("[\d\.]+(?=cm)|[\d\.]+(?= cm)", spe)
    if "UNKNOWN" in spe or not re.search("\d", spe):
        return "UNKNOWN"
    if len(tmn_f) > 0:
        if re.search("[\d\.]+'\d\"", spe):
            if len(re.findall("([\d\.]+)'([\d\.]+)\"", spe)) == 1:
                return round(float(re.findall("([\d\.]+)'([\d\.]+)\"", spe)[0][0])+\
                             float(re.findall("([\d\.]+)'([\d\.]+)\"", spe)[0][1])/12)
        elif len(tmn_f) == 1:
            return round(float(tmn_f[0][:-1]))
        elif re.search("([\d\.]+)(?='\s+to\s+([\d\.]+))", spe):
            return round(st.mean(map(float,re.findall("([\d\.]+)(?='\s+to\s+([\d\.]+))", spe)[0])))
    if len(tmn_i) > 0:
        if len(tmn_i) == 1:
            return round(float(tmn_oi[0])/12)
        elif re.search("([\d\.]+)(?=\"\s+to\s+([\d\.]+(?=\")))", spe):
            return round(st.mean(map(float,re.findall("([\d\.]+)(?=\"\s+to\s+([\d\.]+(?=\")))", spe)[0]))/12)
        elif re.search("([\d\.]+)(?= \"\s+to\s+([\d\.]+(?= \")))", spe):
            return round(st.mean(map(float,re.findall("([\d\.]+)(?= \"\s+to\s+([\d\.]+(?= \")))", spe)[0]))/12)
    if len(tmn_m) > 0:
        if len(tmn_m) == 1:
            return round(float(tmn_om[0])*3.281)
        elif re.search("([\d\.]+)(?=m\s+to\s+([\d\.]+))", spe):
            return round(st.mean(map(float,re.findall("([\d\.]+)(?=m\s+to\s+([\d\.]+))", spe)[0]))*3.281)
        elif re.search("([\d\.]+)(?= m\s+to\s+([\d\.]+))", spe):
            return round(st.mean(map(float,re.findall("([\d\.]+)(?= m\s+to\s+([\d\.]+))", spe)[0]))*3.281)
    if len(tmn_cm) > 0:
        if len(tmn_cm) == 1:
            return round(float(tmn_ocm[0])/30.48)
        elif re.search("([\d\.]+)(?=cm\s+to\s+([\d\.]+))", spe):
            return round(st.mean(map(float,re.findall("([\d\.]+)(?=cm\s+to\s+([\d\.]+))", spe)[0]))/30.48)
        elif re.search("([\d\.]+)(?= cm\s+to\s+([\d\.]+))", spe):
            return round(st.mean(map(float,re.findall("([\d\.]+)(?= cm\s+to\s+([\d\.]+))", spe)[0]))/30.48)    
    else:
        return "UNKNOWN"
    
def cleanspecies(spe):
    spe = spe.lower()
    if "unknown" in spe:
        return "UNKNOWN"
    elif "tiger" in spe and "sand" in spe:
        return "Sand tiger"
    elif "tiger" in spe:
        return "Tiger"
    elif "whitetip" in spe:
        return "Oceanic whitetip"
    elif "white" in spe:
        return "White"
    elif "hammerhead" in spe:
        return "Great hammerhead"
    elif "wobbegong" in spe:
        return "Wobbegong"
    elif "blue" in spe:
        return "Blue"
    elif "blacktip" in spe and "reef" in spe:
        return "Blacktip reef"
    elif "blacktip" in spe or "blackfin" in spe or ("black" in spe and ("tip" in spe or "tipped" in spe))\
    or "limbatus" in spe:
        return "Blacktip"
    elif "leopard" in spe:
        return "Leopard"
    elif "caribbean" in spe:
        return "Caribbean reef"
    elif "bronze whale" in spe or "copper" in spe or "narrowtooth" in spe:
        return "Bronze whaler"
    elif "raggedtooth" in spe:
        return "Raggedtooth"
    elif "mako" in spe or "bonita" in spe or "bonito" in spe:
        return "Shortfin mako"
    elif "zambezi" in spe or "zambesi" in spe or "zambi" in spe or "bull" in spe or "leucas" in spe:
        return "Zambezi"
    elif "nurse" in spe:
        return "Nurse"
    elif "spinner" in spe:
        return "Spinner"
    elif "dusky" in spe:
        return "Dusky"
    elif "sandbar" in spe or "brown-colored" in spe:
        return "Sandbar"
    elif "lemon" in spe:
        return "Lemon"
    elif "horn" in spe:
        return "Horn"
    elif "banjo" in spe:
        return "Banjo"
    elif "galapago" in spe:
        return "Galapagos"
    elif "silky" in spe:
        return "Silky"
    elif "gray" in spe or "grey" in spe:
        return "Gray reef"
    elif "broadnose" in spe or "sevengill" in spe or "seven-gill" in spe or ("seven" in spe and "gill" in spe):
        return "Broadnose sevengill"
    elif "bluntnose" in spe or "sixgill" in spe:
        return "Bluntnose sixgill"
    elif "spotted" in spe or "wobbegong" in spe or "carpet" in spe:
        return "Spotted Wobbegong"
    elif "basking" in spe:
        return "Basking"
    elif "reef" in spe:
        return "Reef"
    elif "sand" in spe:
        return "Sand"
    elif "soup" in spe or "school" in spe or "snapper" in spe or "tope" in spe:
        return "School"
    elif "whale" in spe:
        return "Whale"
    elif "goblin" in spe:
        return "Goblin"
    elif "salmon" in spe:
        return "Salmon"
    elif "spiny" in spe or "dogfish" in spe or "spurgog" in spe or "mud" in spe or "piked" in spe or "dog" in spe:
        return "Spiny dogfish"
    elif "angel" in spe:
        return "Angelshark"
    elif "porbeagle" in spe:
        return "Porbeagle"
    elif "thresher" in spe or "fox" in spe:
        return "Fox"
    elif "cookie" in spe or "cutter" in spe:
        return "Cookiecutter"
    elif "small" in spe or "little" in spe or "juvenile" in spe or "young" in spe:
        return "Small"
    else:
        return "UNKNOWN"

def cleaninjury(inj):
    inj = inj.lower()
    if "unknown" in inj:
        return "UNKNOWN"
    elif ("no" in inj and ("injur" in inj or "inur" in inj or "ijnur" in inj)) or "molested" in inj or (("holed" in inj or "hole" in inj) and "boat" in inj):
        return "No injuries"
    elif ("no" in inj and "body" in inj) or "miss" in inj or "kill" in inj or "dead" in inj or "consume" in inj \
    or "died" in inj or "scaveng" in inj or "perish" in inj:
        return "Dead"
    elif "fatal" in inj or "amputat" in inj or "sever" in inj or "serious" in inj or "massive" in inj \
    or "remove" in inj or "lost" in inj or "avuls" in inj or "bared" in inj or "mutilate" in inj:
        return "Seriously injured"
    elif "minor" in inj or "lacerat" in inj or "cut" in inj or "abrasion" in inj or "nipp" in inj \
    or "bruise" in inj or "blow" in inj or "graze" in inj or "scratch" in inj or "abraded" in inj or "small" in inj\
    or "hit" in inj or "pinch" in inj:
        return "Lacerations"
    elif "bit" in inj or "puncture" in inj or "injur" in inj or "gash" in inj or "wound" in inj \
    or "toothmark" in inj or "grasp" in inj or "grab" in inj or "torn" in inj or "injur" in inj \
    or "inur" in inj or "fractur" in inj or "broke" in inj:
        return "Injured"
    else:
        return "UNKNOWN"

def cleantype(typ):
    typ = typ.lower()
    if "boating" in typ:
        return "Boat"
    elif "unknown" in typ:
        return "UNKNOWN"
    else:
        return typ.capitalize()