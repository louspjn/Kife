def getEditor(config):
  if 'editor' in config:
    return config['editor']
  else:
    return "nano"

def getProjects(config):
  if 'projects' in config:
    return config['projects']
  else:
    return {""}
