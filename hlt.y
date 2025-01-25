import sqlite3

# Conexión a la base de datos (se creará si no existe)
conn = sqlite3.connect("datos_salud.db")
cursor = conn.cursor()

# Crear tabla para almacenar datos de salud
cursor.execute('''
CREATE TABLE IF NOT EXISTS salud (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    edad INTEGER NOT NULL,
    peso REAL NOT NULL,
    altura REAL NOT NULL,
    presion_arterial TEXT NOT NULL
)
''')

print("Tabla creada exitosamente.")

# Función para agregar datos
def agregar_datos(nombre, edad, peso, altura, presion_arterial):
    cursor.execute('''
    INSERT INTO salud (nombre, edad, peso, altura, presion_arterial)
    VALUES (?, ?, ?, ?, ?)
    ''', (nombre, edad, peso, altura, presion_arterial))
    conn.commit()
    print("Datos agregados correctamente.")

# Función para mostrar todos los datos
def mostrar_datos():
    cursor.execute('SELECT * FROM salud')
    registros = cursor.fetchall()
    for registro in registros:
        print(registro)

# Ejemplo de uso
agregar_datos("Juan Pérez", 35, 70.5, 1.75, "120/80")
agregar_datos("Ana López", 28, 65.0, 1.68, "110/70")

print("\nDatos almacenados:")
mostrar_datos()

# Cerrar la conexión
conn.close()
