from django.contrib.auth.models import BaseUserManager


class EmailUserManager(BaseUserManager):
    """ Class of Manager that works with user's email instead of username """

    use_in_migrations = True

    def _create_user(self, email, password, **kwargs):
        """ Creates and saves a User with the given email and password. """
        if not email:
            raise ValueError('The given email must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **kwargs)
        user.set_password(password)
        user.save()
        return user

    def create_user(self, email, password, is_staff=False, is_superuser=False):
        return self._create_user(email, password, is_staff=is_staff, is_superuser=is_superuser)

    def create_superuser(self, email, password):
        return self._create_user(email, password, is_staff=True, is_superuser=True)