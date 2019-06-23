# -*- coding: utf-8 -*-
# Funciones para dibujar gráficos y compararlo con el tamaño
# .sort_values(['count'], ascending=False)

from matplotlib import pyplot as plt
import math
import pandas as pd

# Función que devuelve n_plots gráficos de la columna f_col del dataframe f_df. El df se ordena para devolver primero los gráficos con más counts()

def draw_plot(f_df, f_col, n_plots):

    f_df_aux = f_df.groupby([f_col, "Sizes"])["Sizes"].count().unstack().fillna(0).stack()
    f_df_order = f_df.groupby([f_col])["Sizes"].count().reset_index(name='count').sort_values(['count'], ascending=False)
    
    fig=plt.figure(figsize=(20,10))
    fig.suptitle("Cantidad de {} vs Sizes".format(f_col), fontsize=16) # No me funciona, no sé por qué
    fig.subplots_adjust(hspace=0.4, wspace=0.4)
    
    colors = ["gray", "b", "g", "orange", "skyblue", "r", "black", "coral", "brown", "k", "pink"]
    ic = 0

    for i, e in enumerate(f_df_order[f_col]):
        if i >= n_plots:
            break
        else:
            if ic >= len(colors) :
                ic = 0
            plt.subplot(math.ceil(n_plots/2),2,i+1)
            ataque=f_df_aux[e]
            ataque.plot(kind='bar', color=colors[ic])
            plt.title(e + "Shark",size=12,fontweight='bold')
            plt.ylabel('Number of attacks',size=10) 
            plt.xlabel('Sizes',size=10)
            ic += 1

def draw_frequency(f_df, f_col):
    freq = f_df[[f_col, "Sizes"]].copy()
    cross_table = pd.crosstab(index=freq[f_col], columns=freq["Sizes"], margins=True)
    for col in cross_table:
            cross_table[col] = cross_table[col]/freq["Sizes"].count()*100
            cross_table[col] = cross_table[col].apply(lambda x: round(x,2))
    return cross_table