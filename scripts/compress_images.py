import os
import sys
from PIL import Image

def compress_image(file_path, quality=85):
    try:
        img = Image.open(file_path)

        # Obtenir l'extension
        ext = os.path.splitext(file_path)[1].lower()

        if ext in ['.jpg', '.jpeg']:
            img.save(file_path, "JPEG", optimize=True, quality=quality)
        elif ext == '.png':
            # Conversion en RGB si nécessaire pour la compression JPEG,
            # mais ici on garde le format d'origine
            img.save(file_path, "PNG", optimize=True)

        print(f"Compressé: {file_path}")
    except Exception as e:
        print(f"Erreur sur {file_path}: {e}")

def run_compression(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.lower().endswith(('.png', '.jpg', '.jpeg')):
                compress_image(os.path.join(root, file))

if __name__ == "__main__":
    assets_dir = os.path.join(os.getcwd(), "assets")
    if not os.path.exists(assets_dir):
        print(f"Dossier non trouvé: {assets_dir}")
        sys.exit(1)

    print(f"Démarrage de la compression dans: {assets_dir}")
    # Nécessite 'pip install Pillow'
    try:
        run_compression(assets_dir)
        print("Compression terminée.")
    except ImportError:
        print("Erreur: La bibliothèque 'Pillow' n'est pas installée.")
        print("Lancez: pip install Pillow")
