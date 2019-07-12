from pipeline.extractors import connect
from pipeline.transformers import create_df_score, normalize, normalize_bis, call_places
from pipeline.loaders import draw_html
import os

import warnings
warnings.filterwarnings("ignore")

def main():
    df = connect()
    df_score = create_df_score(df)
    df_norm = normalize(df_score)
    df_top_5 = call_places(df_norm[["total"]].head())
    df_norm_bis = normalize_bis(df_top_5)
    draw_html(df_score, df_top_5, df_norm_bis, os.path.dirname(os.path.realpath(__file__)))

if __name__ == "__main__":
    main()