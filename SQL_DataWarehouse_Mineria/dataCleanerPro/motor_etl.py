import pandas as pd

def ejecutar_limpieza(df):
    """
    Recibe un DataFrame crudo, aplica limpieza ETL estricta 
    y retorna el DataFrame estandarizado.
    """
    df_limpio = df.drop_duplicates()
    # 2. Eliminar nulos (ruido e inconsistencias)
    df_limpio = df_limpio.dropna()
    # 3. Estandarización: Convertir variables categóricas de texto a numéricas (dummy)
    df_limpio = pd.get_dummies(df_limpio, drop_first = True, dtype=int)
    return df_limpio


