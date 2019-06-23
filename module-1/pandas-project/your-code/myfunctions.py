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
        return "Unknown"
    elif "tiger" in spe and "sand" in spe:
        return "Sand tiger shark"
    elif "tiger" in spe:
        return "Tiger shark"
    elif "whitetip" in spe:
        return "Oceanic whitetip shark"
    elif "white" in spe:
        return "White shark"
    elif "hammerhead" in spe:
        return "Great hammerhead shark"
    elif "wobbegong" in spe:
        return "Wobbegong shark"
    elif "blue" in spe:
        return "Blue shark"
    elif "blacktip" in spe and "reef" in spe:
        return "Blacktip reef shark"
    elif "blacktip" in spe or "blackfin" in spe or ("black" in spe and ("tip" in spe or "tipped" in spe))\
    or "limbatus" in spe:
        return "Blacktip shark"
    elif "leopard" in spe:
        return "Leopard shark"
    elif "caribbean" in spe:
        return "Caribbean reef shark"
    elif "bronze whale" in spe or "copper" in spe or "narrowtooth" in spe:
        return "Bronze whaler shark"
    elif "raggedtooth" in spe:
        return "Raggedtooth shark"
    elif "mako" in spe or "bonita" in spe or "bonito" in spe:
        return "Shortfin mako shark"
    elif "zambezi" in spe or "zambesi" in spe or "zambi" in spe or "bull" in spe or "leucas" in spe:
        return "Zambezi shark"
    elif "nurse" in spe:
        return "Nurse shark"
    elif "spinner" in spe:
        return "Spinner shark"
    elif "dusky" in spe:
        return "Dusky shark"
    elif "sandbar" in spe or "brown-colored" in spe:
        return "Sandbar shark"
    elif "lemon" in spe:
        return "Lemon shark"
    elif "horn" in spe:
        return "Horn shark"
    elif "banjo" in spe:
        return "Banjo shark"
    elif "galapago" in spe:
        return "Galapagos shark"
    elif "silky" in spe:
        return "Silky shark"
    elif "gray" in spe or "grey" in spe:
        return "Gray reef shark"
    elif "broadnose" in spe or "sevengill" in spe or "seven-gill" in spe or ("seven" in spe and "gill" in spe):
        return "Broadnose sevengill shark"
    elif "bluntnose" in spe or "sixgill" in spe:
        return "Bluntnose sixgill shark"
    elif "spotted" in spe or "wobbegong" in spe or "carpet" in spe:
        return "Spotted Wobbegong shark"
    elif "basking" in spe:
        return "Basking shark"
    elif "reef" in spe:
        return "Reef shark"
    elif "sand" in spe:
        return "Sand shark"
    elif "soup" in spe or "school" in spe or "snapper" in spe or "tope" in spe:
        return "School shark"
    elif "whale" in spe:
        return "Whale shark"
    elif "goblin" in spe:
        return "Goblin shark"
    elif "salmon" in spe:
        return "Salmon shark"
    elif "spiny" in spe or "dogfish" in spe or "spurgog" in spe or "mud" in spe or "piked" in spe or "dog" in spe:
        return "Spiny dogfish"
    elif "angel" in spe:
        return "Angelshark"
    elif "porbeagle" in spe:
        return "Porbeagle shark"
    elif "thresher" in spe or "fox" in spe:
        return "Fox shark"
    elif "cookie" in spe or "cutter" in spe:
        return "Cookiecutter shark"
    elif "small" in spe or "little" in spe or "juvenile" in spe or "young" in spe:
        return "Small shark"
    else:
        return "Unknown"