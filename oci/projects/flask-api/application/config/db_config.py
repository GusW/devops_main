import os
from .filesystem import DB_PATH, DB_NAME


class DBConfig(object):
    SQLALCHEMY_DATABASE_URI = (os.environ.get('DATABASE_URL') or
                               'sqlite:///' + os.path.join(DB_PATH, DB_NAME))
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    def handle_existing_database(self):
        ''' Verifies preexisting database created
            Creates a database otherwise
        '''
        from sqlalchemy_utils import database_exists

        if not database_exists(self.SQLALCHEMY_DATABASE_URI):
            from application.config.core import db
            from application.db_models.user import User

            db.create_all()
            db.session.commit()
