# -*- coding: utf-8 -*-
# Funciones para dibujar gráficos y compararlo con el tamaño
# .sort_values(['count'], ascending=False)

from matplotlib import pyplot as plt
import math

def draw_plot(f_df, f_col, n_plots):

    f_df_aux = f_df.groupby([f_col, "Sizes"])["Sizes"].count().unstack().fillna(0).stack()
    f_df_order = f_df.groupby([f_col])["Sizes"].count().reset_index(name='count').sort_values(['count'], ascending=False)
    
    fig=plt.figure(figsize=(20,10))
    fig.subplots_adjust(hspace=0.4, wspace=0.4)
    
    colors = ["gray", "b", "g", "orange", "skyblue", "r", "black", "coral", "brown", "k", "pink"]
    
    for i, e in enumerate(f_df_order[f_col]):
        if i >= n_plots:
            break
        else:
            plt.subplot(math.ceil(n_plots/2),2,i+1)
            ataque=f_df_aux[e]
            ataque.plot(kind='bar', color=colors[i])
            plt.title(e,size=12,fontweight='bold')
            plt.ylabel('Number of attacks',size=10) 
            plt.xlabel('Sizes',size=10)