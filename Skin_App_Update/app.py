import streamlit as st
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from streamlit_option_menu import option_menu

# Fungsi untuk membaca dataset
def read_dataset(file_path):
    return pd.read_excel(file_path)

# Fungsi untuk melakukan prediksi berdasarkan model
def predict_skin_disease(model, ruam, gatal, kemerahan, bentol, penebalan_kulit):
    prediction = model.predict([[ruam, gatal, kemerahan, bentol, penebalan_kulit]])
    return prediction[0]

# Load dataset
df = pd.read_excel('data/kulit.xlsx')

# Model training
X = df.drop('Diagnosis', axis=1)
y = df['Diagnosis']
model = DecisionTreeClassifier(random_state=42)
model.fit(X, y)

# Set layout agar lebih lebar
st.set_page_config(page_title='Skin Diseases App', layout='wide')

# Menu navigasi
selected = option_menu(
    menu_title=None,
    options=["Beranda", "Dataset", "Prediksi"],
    icons=["house", "book", "calculator"],
    menu_icon="cast",
    default_index=0,
    orientation="horizontal",
)

if selected == "Beranda":
    st.title('Skin Diseases App')
    st.write('Skin Diseases App adalah sebuah aplikasi yang berguna untuk memprediksi kemungkinan seseorang menderita penyakit kulit berdasarkan beberapa fitur yang dimasukkan. Aplikasi ini menggunakan dataset tentang berbagai kondisi penyakit kulit untuk melakukan prediksi. Dengan memasukkan fitur yang relevan, seperti jenis ruam, tingkat gatal-gatal, kemerahan, bentol, atau penebalan kulit, aplikasi ini dapat memberikan prediksi mengenai jenis penyakit kulit yang mungkin diderita oleh seseorang. Aplikasi ini sangat bermanfaat bagi orang-orang yang ingin mengetahui kemungkinan jenis penyakit kulit yang mereka alami, sehingga dapat segera berkonsultasi dengan dokter atau spesialis kulit untuk pengobatan yang tepat.')
    
    # List daftar penyakit
    st.markdown("**Daftar Penyakit:**")
    st.markdown("1. Jerawat")
    st.markdown("2. Psoriasis")
    st.markdown("3. Eksim")
    st.markdown("4. Dermatitis")
    
elif selected == "Dataset":
    st.title('Info Dataset')
    st.write('**Dataset dan Atribut:**')
    st.write(df.head())
    
    # List daftar atribut
    st.markdown("1. Ruam: Merupakan fitur yang menunjukkan apakah pasien memiliki ruam (Ya/Tidak)")
    st.markdown("2. Gatal: Merupakan fitur yang menunjukkan apakah pasien memiliki gatal-gatal (Ya/Tidak)")
    st.markdown("3. Kemerahan: Merupakan fitur yang menunjukkan apakah pasien mengalami kemerahan (Ya/Tidak)")
    st.markdown("4. Bentol: Merupakan fitur yang menunjukkan apakah pasien memiliki bentol (Ya/Tidak)")
    st.markdown("5. Penebalan Kulit: Merupakan fitur yang menunjukkan apakah pasien mengalami penebalan kulit (Ya/Tidak)")

else:
    st.title('Prediksi')
    st.write('**Masukkan gejala-gejala berikut:**')
    
    # Tampilkan pilihan secara horizontal
    col1, col2, col3, col4, col5 = st.columns(5)
    with col1:
        ruam = st.radio('Ruam', ['Ya', 'Tidak'])
    with col2:
        gatal = st.radio('Gatal', ['Ya', 'Tidak'])
    with col3:
        kemerahan = st.radio('Kemerahan', ['Ya', 'Tidak'])
    with col4:
        bentol = st.radio('Bentol', ['Ya', 'Tidak'])
    with col5:
        penebalan_kulit = st.radio('Penebalan Kulit', ['Ya', 'Tidak'])

    if st.button('Prediksi'):
        ruam_val = 1 if ruam == 'Ya' else 0
        gatal_val = 1 if gatal == 'Ya' else 0
        kemerahan_val = 1 if kemerahan == 'Ya' else 0
        bentol_val = 1 if bentol == 'Ya' else 0
        penebalan_kulit_val = 1 if penebalan_kulit == 'Ya' else 0

        prediction = predict_skin_disease(model, ruam_val, gatal_val, kemerahan_val, bentol_val, penebalan_kulit_val)
        if prediction:
            st.success(f"{prediction}")
        else:
            st.error(f"{prediction}")
