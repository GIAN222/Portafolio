import streamlit as st
import pandas as pd
from textos import diccionario  
from motor_etl import ejecutar_limpieza

st.set_page_config(page_title="DataCleaner Pro | GianF", page_icon="⚙️", layout="centered")

# 1. Selector de idioma
idioma_seleccionado = st.radio("Idioma / Language:", ["Español", "English"], horizontal= True)

# 2. Cargamos el paquete de textos correspondiente al idioma elegido
t = diccionario[idioma_seleccionado]

# 3. Dibujamos la interfaz usando las variables (sin texto quemado)
st.title(t["titulo"])
st.markdown(t["bienvenida"])
st.markdown(t["instrucciones"])
st.divider()

archivo_subido = st.file_uploader(t["drag_drop"], type=["csv", "xlsx"])

# 4. Motor lógico (ETL)
if archivo_subido is not None:
    try:
        if archivo_subido.name.endswith('.csv'):
            df = pd.read_csv(archivo_subido)
        else:
            df = pd.read_excel(archivo_subido)
            
        if df.shape[0] > 5000:
            st.error(t["msg_grande"].format(df.shape[0]))
            st.stop()
            
        st.success(t["msg_exito"])
        st.subheader(t["msg_vista"])
        st.dataframe(df.head())

        st.divider()

        df_limpio = ejecutar_limpieza(df)
        filas_originales = df.shape[0]
        filas_finales = df_limpio.shape[0]

        st.success(t["msg_limpieza"].format(filas_originales, filas_finales))
        st.dataframe(df_limpio.head())

        # Generar el archivo final para descarga
        csv_limpio = df_limpio.to_csv(index = False).encode('utf-8')
        st.download_button(
            label = t["btn_descarga"],
            data = csv_limpio,
            file_name = "Datos_normalizados.csv",
            # le dice a la navegador que tipo de archuvo esta recibiendo para que lo procese de manera correcta
            mime="text/csv"
        )

        # --- SIGUIENTE PASO: INYECTAR LA LIMPIEZA CON PANDAS AQUÍ ---
        
    except Exception as e:
        st.error(t["msg_error"])
        
