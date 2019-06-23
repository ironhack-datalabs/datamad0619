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
    