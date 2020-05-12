from pathlib import Path

module_path = Path(__file__).parent.parent
templates_path = module_path.joinpath("templates")

DB_PATH = '/volumes'
DB_NAME = 'flask-user-api.db'
