from os import system
from time import sleep

def proj(editor, path):
  cmd = f"cd {path}"
  print(f"\nEntrando no diretório {path}")
  sleep(1)

  system(f'{cmd}; {editor}')
